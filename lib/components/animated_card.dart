import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String? _youtubeVideoIdFromWatchUrl(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null) return null;
  if (uri.host.contains('youtu.be') && uri.pathSegments.isNotEmpty) {
    return uri.pathSegments.first;
  }
  return uri.queryParameters['v'];
}

class AnimatedCard extends StatefulWidget {
  final String? imagePath;
  final String? youtubeWatchUrl;
  final String? text;
  final BoxFit? fit;
  final bool reverse;
  final double? width;
  final double? height;

  const AnimatedCard({
    super.key,
    this.imagePath,
    this.youtubeWatchUrl,
    this.text,
    this.fit,
    this.reverse = false,
    this.width,
    this.height,
  }) : assert(
         imagePath != null || youtubeWatchUrl != null,
         'Provide imagePath and/or youtubeWatchUrl',
       );

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(
      begin: widget.reverse ? Offset(0, 0.08) : Offset.zero,
      end: widget.reverse ? Offset.zero : Offset(0, 0.08),
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _media(double width, double height) {
    if (widget.youtubeWatchUrl != null) {
      final id = _youtubeVideoIdFromWatchUrl(widget.youtubeWatchUrl!);
      final thumbUrl = id != null
          ? 'https://img.youtube.com/vi/$id/hqdefault.jpg'
          : null;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            final uri = Uri.parse(widget.youtubeWatchUrl!);
            await launchUrl(uri);
          },
          child: ClipRRect(
            borderRadius: .circular(8),
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  if (thumbUrl != null)
                    Image.network(
                      thumbUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          ColoredBox(color: Colors.grey.shade300),
                    )
                  else
                    ColoredBox(color: Colors.grey.shade300),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.4),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.play_circle_filled,
                    size: 72,
                    color: Colors.white.withValues(alpha: 0.95),
                    shadows: const [
                      Shadow(blurRadius: 12, color: Colors.black54),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Image.asset(
      widget.imagePath!,
      height: height,
      width: width,
      fit: widget.fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.width ?? 200;
    final h = widget.height ?? 200;
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(15),
          side: BorderSide(color: AppConstants.primaryColor, width: 2),
        ),
        shadowColor: AppConstants.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              _media(w, h),
              SizedBox(height: 10),
              widget.text == null
                  ? SizedBox()
                  : SansBold(text: widget.text!, size: 15),
            ],
          ),
        ),
      ),
    );
  }
}
