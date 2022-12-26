enum JoltUIScale {
  tiny(0.8, 'tiny'),
  small(0.9, 'small'),
  medium(1.0, 'medium'),
  large(1.1, 'large'),
  huge(1.2, 'huge');

  final double value;
  final String label;

  const JoltUIScale(this.value, this.label);
}
