import 'package:flutter/material.dart';

class InquiryTypeDropdown extends StatefulWidget {
  final Function(String?)? onChanged;
  final String? errorText;

  const InquiryTypeDropdown({super.key, this.onChanged, this.errorText});

  @override
  _InquiryTypeDropdownState createState() => _InquiryTypeDropdownState();
}

class _InquiryTypeDropdownState extends State<InquiryTypeDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  String? selectedType;

  final List<String> inquiryTypes = [
    '🎓 Admissions & Enrollment Inquiries',
    '🔖 Academic Inquiries',
    '💰 Finance-Related',
    '🏠 Accommodation & Hostel Inquiries',
    '🧾 Document Requests',
    '🛠️ IT & Portal Support',
    '🧍‍♂️ Student Life & Campus Facilities',
  ];

  void toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  void selectOption(String option) {
    setState(() {
      selectedType = option;
    });
    widget.onChanged?.call(option);
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 8,
            width: size.width,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      inquiryTypes.map((type) {
                        return ListTile(
                          title: Text(
                            type,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () => selectOption(type),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Inquiry Type',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: toggleDropdown,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color:
                        widget.errorText != null
                            ? Colors.red
                            : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedType ?? 'Select inquiry type',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              selectedType == null
                                  ? Colors.grey.shade600
                                  : Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Icon(
                      _overlayEntry != null
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            if (widget.errorText != null) ...[
              SizedBox(height: 4),
              Text(
                widget.errorText!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
