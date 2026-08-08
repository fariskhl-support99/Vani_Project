import 'package:flutter/material.dart';

class VaniMarkdownText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const VaniMarkdownText({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(children: _parseVaniMarkdown(text)),
    );
  }

  List<InlineSpan> _parseVaniMarkdown(String input) {
    List<InlineSpan> spans = [];
    final exp = RegExp(
      r'(\*([^*]+)\*)|(_([^_]+)_)|(~([^~]+)~)|(=([^=]+)=)|(<([^>]+)>)|("([^"]+)")|(`([^`]+)`)',
    );

    int start = 0;
    for (final match in exp.allMatches(input)) {
      if (match.start > start) {
        spans.add(TextSpan(text: input.substring(start, match.start), style: style));
      }

      if (match.group(1) != null) {
        // *عريض*
        spans.add(TextSpan(text: match.group(2), style: (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold)));
      } else if (match.group(3) != null) {
        // _مائل_
        spans.add(TextSpan(text: match.group(4), style: (style ?? const TextStyle()).copyWith(fontStyle: FontStyle.italic)));
      } else if (match.group(5) != null) {
        // ~مشطوب~
        spans.add(TextSpan(text: match.group(6), style: (style ?? const TextStyle()).copyWith(decoration: TextDecoration.lineThrough)));
      } else if (match.group(7) != null) {
        // =تحته خط=
        spans.add(TextSpan(text: match.group(8), style: (style ?? const TextStyle()).copyWith(decoration: TextDecoration.underline)));
      } else if (match.group(9) != null) {
        // <مخفي> (Spoiler)
        spans.add(WidgetSpan(child: _SpoilerWidget(text: match.group(10)!)));
      } else if (match.group(11) != null) {
        // "اقتباس"
        spans.add(TextSpan(
          text: '“${match.group(12)}”',
          style: (style ?? const TextStyle()).copyWith(backgroundColor: Colors.black12, fontStyle: FontStyle.italic),
        ));
      } else if (match.group(13) != null) {
        // `كود`
        spans.add(WidgetSpan(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
            child: Text(match.group(14)!, style: const TextStyle(fontFamily: 'monospace')),
          ),
        ));
      }

      start = match.end;
    }

    if (start < input.length) {
      spans.add(TextSpan(text: input.substring(start), style: style));
    }

    return spans;
  }
}

class _SpoilerWidget extends StatefulWidget {
  final String text;
  const _SpoilerWidget({required this.text});

  @override
  State<_SpoilerWidget> createState() => _SpoilerWidgetState();
}

class _SpoilerWidgetState extends State<_SpoilerWidget> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _revealed = !_revealed),
      child: Container(
        color: _revealed ? Colors.transparent : Colors.grey.shade700,
        child: Text(
          widget.text,
          style: TextStyle(color: _revealed ? Colors.black : Colors.transparent),
        ),
      ),
    );
  }
}
