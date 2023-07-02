import joltPubspec from "!!raw-loader!../../packages/jolt/pubspec.yaml";
import { parse } from "yaml";


export const dartVersion = parse(joltPubspec).environment.sdk;
export const flutterVersion = parse(joltPubspec).environment.flutter;
export const joltVersion = parse(joltPubspec).version;
