import 'package:flutter/material.dart';

class ImagePreviewControls extends StatelessWidget {
  const ImagePreviewControls({
    required this.imagePath,
    required this.isAnalyzing,
    required this.hasAnalyzed,
    required this.showAnalysis,
    required this.hasDetections,
    required this.onAnalyze,
    required this.onToggleView,
    required this.onBack,
    required this.onRetake,
    super.key,
  });

  final String imagePath;
  final bool isAnalyzing;
  final bool hasAnalyzed;
  final bool showAnalysis;
  final bool hasDetections;
  final VoidCallback onAnalyze;
  final VoidCallback onToggleView;
  final VoidCallback onBack;
  final VoidCallback onRetake;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top controls
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTopButton(
                  icon: Icons.arrow_back,
                  onPressed: isAnalyzing ? null : onBack,
                ),
                if (hasDetections)
                  _buildTopButton(
                    icon: showAnalysis ? Icons.image : Icons.analytics,
                    onPressed: onToggleView,
                  )
                else
                  _buildTopButton(
                    icon: Icons.info_outline,
                    onPressed: () => _showInfoSnackBar(context),
                  ),
              ],
            ),
          ),
        ),

        // Bottom actions
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Retake button
                  _buildActionButton(
                    icon: Icons.camera_alt,
                    label: 'Retake',
                    color: Colors.orange,
                    enabled: !isAnalyzing,
                    onPressed: onRetake,
                  ),

                  // Analyze button
                  _buildActionButton(
                    icon: hasAnalyzed ? Icons.check : Icons.auto_awesome,
                    label: isAnalyzing
                        ? 'Analyzing...'
                        : hasAnalyzed
                            ? 'Analyzed'
                            : 'Analyze',
                    color:
                        isAnalyzing || hasAnalyzed ? Colors.grey : Colors.blue,
                    enabled: !isAnalyzing && !hasAnalyzed,
                    onPressed: onAnalyze,
                    isLoading: isAnalyzing,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required bool enabled,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return ElevatedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  void _showInfoSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Square image captured successfully'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
