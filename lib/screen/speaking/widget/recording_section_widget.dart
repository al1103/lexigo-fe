import 'dart:math';

import 'package:flutter/material.dart';

class RecordingSectionWidget extends StatelessWidget {
  const RecordingSectionWidget({
    required this.isRecording,
    required this.recordingDuration,
    required this.maxDuration,
    required this.breathingAnimation,
    required this.waveAnimation,
    required this.progressAnimation,
    required this.onStartRecording,
    required this.onStopRecording,
    super.key,
  });
  final bool isRecording;
  final int recordingDuration;
  final int maxDuration;
  final Animation<double> breathingAnimation;
  final Animation<double> waveAnimation;
  final Animation<double> progressAnimation;
  final VoidCallback onStartRecording;
  final VoidCallback onStopRecording;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Recording visualizer
        if (isRecording) _buildEnhancedVisualizer(),

        const SizedBox(height: 24),

        // Countdown timer
        if (isRecording) _buildModernTimer(),

        const SizedBox(height: 32),

        // Enhanced microphone button
        _buildEnhancedMicButton(),

        const SizedBox(height: 16),

        // Tips
      ],
    );
  }

  Widget _buildEnhancedVisualizer() {
    return AnimatedBuilder(
      animation: waveAnimation,
      builder: (context, child) {
        return Container(
          height: 140,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade50,
                Colors.pink.shade50,
                Colors.red.shade50,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.red.shade100, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.2),
                blurRadius: 25,
                offset: const Offset(0, 12),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Recording...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.red.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(9, (index) {
                  const baseHeight = 15.0;
                  const maxHeight = 40.0;
                  final animatedHeight = baseHeight +
                      (maxHeight *
                          sin((waveAnimation.value * 4 * pi) + (index * 0.7)));

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 5,
                    height: animatedHeight.abs().clamp(baseHeight, maxHeight),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.shade300,
                          Colors.red.shade500,
                          Colors.red.shade700,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModernTimer() {
    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, child) {
        final remaining = maxDuration - recordingDuration;
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade50,
                Colors.red.shade50,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.orange.shade200, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.timer_rounded,
                      color: Colors.orange.shade600,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${remaining}s remaining',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 8,
                  child: LinearProgressIndicator(
                    value: progressAnimation.value,
                    backgroundColor: Colors.orange.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      remaining <= 1
                          ? Colors.red.shade500
                          : Colors.orange.shade500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEnhancedMicButton() {
    return AnimatedBuilder(
      animation: breathingAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: isRecording ? onStopRecording : onStartRecording,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (isRecording
                          ? Colors.red.shade400
                          : const Color(0xFF667EEA))
                      .withOpacity(0.4),
                  blurRadius: isRecording ? 30 : 25,
                  offset: const Offset(0, 8),
                  spreadRadius: isRecording ? 8 : 2,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.9),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Transform.scale(
              scale: isRecording ? breathingAnimation.value : 1.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isRecording
                        ? [
                            Colors.red.shade400,
                            Colors.red.shade600,
                            Colors.red.shade800,
                          ]
                        : [
                            const Color(0xFF667EEA),
                            const Color(0xFF764BA2),
                            const Color(0xFF6B73FF),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isRecording)
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    Icon(
                      isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                      color: Colors.white,
                      size: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTip(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
