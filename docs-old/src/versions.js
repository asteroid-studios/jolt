import joltPubspec from "!!raw-loader!../../packages/jolt/pubspec.yaml";
import { parse } from "yaml";

export const joltVersion = 
`environment:
  sdk: "${parse(joltPubspec).environment.sdk}"
  flutter: "${parse(joltPubspec).environment.flutter}"

dependencies:
  flutter:
    sdk: flutter
// highlight-next-line
  jolt: ^${parse(joltPubspec).version}
`;