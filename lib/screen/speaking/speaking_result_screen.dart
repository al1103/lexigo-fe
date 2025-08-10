import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';

@RoutePage()
class SpeakingResultScreen extends StatefulWidget {
  const SpeakingResultScreen({
    required this.speakingResult,
    required this.recordingPath,
    this.onContinue,
    this.onTryAgain,
    super.key,
  });

  final SpeakingResult speakingResult;
  final String recordingPath;
  final VoidCallback? onContinue;
  final VoidCallback? onTryAgain;

  @override
  State<SpeakingResultScreen> createState() => _SpeakingResultScreenState();
}

class _SpeakingResultScreenState extends State<SpeakingResultScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get scoreColor {
    final score = widget.speakingResult.overallScore ?? 0;
    if (score >= 80) return const Color(0xFF34D399);
    if (score >= 60) return const Color(0xFFFBBF24);
    return const Color(0xFFF87171);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Kết quả phát âm',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2937),
          ),
        ),
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildScoreCard(),
              const SizedBox(height: 20),
              _buildTextSection(),
              const SizedBox(height: 20),
              _buildWordAnalysisSection(),
              const SizedBox(height: 100), // Space for floating buttons
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildActionButtons(),
    );
  }

  Widget _buildScoreCard() {
    final score = widget.speakingResult.overallScore ?? 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE0E7FF),
            Color(0xFFFDF2F8),
          ], // very light purple to very light pink
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1)
                .withValues(alpha: 0.08), // lighter shadow
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          // Score Circle
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 10,
                  backgroundColor:
                      Colors.grey.withValues(alpha: 0.2), // lighter
                  valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
                ),
              ),
              Column(
                children: [
                  Text(
                    '$score%',
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF374151), // dark gray
                      letterSpacing: -1,
                      shadows: [
                        Shadow(
                          color: Colors.black12,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Điểm',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280), // neutral gray
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Accuracy Level
          if (widget.speakingResult.accuracyLevel != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color:
                    const Color(0xFF6366F1).withValues(alpha: 0.1), // lighter
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                widget.speakingResult.accuracyLevel!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6366F1),
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFAFAFA),
            Color(0xFFFFFDF7),
          ], // very light gray to very light yellow
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.text_fields, color: Color(0xFF8B5CF6), size: 20),
              SizedBox(width: 8),
              Text(
                'So sánh văn bản',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Reference Text
          _buildTextBox(
            'Tham khảo',
            widget.speakingResult.referenceText ?? 'N/A',
            const Color(0xFF10B981),
          ),
          const SizedBox(height: 12),

          // Spoken Text
          _buildTextBox(
            'Câu nói của bạn',
            widget.speakingResult.spokenText ?? 'N/A',
            const Color(0xFF6366F1),
          ),

          // IPA Section
          if (widget.speakingResult.referenceIpa != null ||
              widget.speakingResult.spokenIpa != null) ...[
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.analytics, color: Color(0xFF8B5CF6), size: 20),
                SizedBox(width: 8),
                Text(
                  'Phát âm IPA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF374151),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (widget.speakingResult.referenceIpa != null)
              _buildIPABox(
                'IPA tham khảo',
                widget.speakingResult.referenceIpa!,
                const Color(0xFF10B981),
              ),
            if (widget.speakingResult.spokenIpa != null) ...[
              const SizedBox(height: 8),
              _buildIPABox(
                'IPA của bạn',
                widget.speakingResult.spokenIpa!,
                const Color(0xFF8B5CF6),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildTextBox(String label, String text, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1), // lighter
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2), // lighter
        ), // reduced opacity
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIPABox(String label, String ipa, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1), // lighter
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Expanded(
            child: Text(
              ipa,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordAnalysisSection() {
    final wordAnalysis = widget.speakingResult.wordAnalysis ?? [];

    if (wordAnalysis.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFAFAFA),
            Color(0xFFFFFDF7),
          ], // very light gray to very light yellow
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.assessment, color: Color(0xFF8B5CF6), size: 20),
              SizedBox(width: 8),
              Text(
                'Phân tích từ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...wordAnalysis.map(_buildWordItem),
        ],
      ),
    );
  }

  Widget _buildWordItem(WordAnalysis analysis) {
    final score = analysis.score ?? 0;
    final color = score >= 80
        ? const Color(0xFF10B981)
        : score >= 60
            ? const Color(0xFFF59E0B)
            : const Color(0xFFEF4444);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)), // lighter
      ),
      child: Row(
        children: [
          // Score Badge
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color,
                  color.withValues(alpha: 0.8),
                ], // softer gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$score',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Word Comparison
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Mong đợi: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    Text(
                      analysis.reference ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Đã nói: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    Text(
                      analysis.spoken ?? 'N/A',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
                if (analysis.status != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15), // lighter
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      analysis.status!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                widget.onTryAgain?.call();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Thử lại'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF8B5CF6),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                widget.onContinue?.call();
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Tiếp tục'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
