library payjoin;

import "dart:async";
import "dart:convert";
import "dart:ffi";
import "dart:io" show Platform, File, Directory;
import "dart:isolate";
import "dart:typed_data";
import "package:ffi/ffi.dart";

class OutPoint {
  final String txid;
  final int vout;

  OutPoint({required this.txid, required this.vout});
}

class FfiConverterOutPoint {
  static OutPoint lift(RustBuffer buf) {
    return FfiConverterOutPoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<OutPoint> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final txid_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final txid = txid_lifted.value;
    new_offset += txid_lifted.bytesRead;
    final vout_lifted = FfiConverterUInt32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vout = vout_lifted.value;
    new_offset += vout_lifted.bytesRead;
    return LiftRetVal(
      OutPoint(txid: txid, vout: vout),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(OutPoint value) {
    final total_length =
        FfiConverterString.allocationSize(value.txid) +
        FfiConverterUInt32.allocationSize(value.vout) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(OutPoint value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterString.write(
      value.txid,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt32.write(
      value.vout,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(OutPoint value) {
    return FfiConverterString.allocationSize(value.txid) +
        FfiConverterUInt32.allocationSize(value.vout) +
        0;
  }
}

class PsbtInput {
  final TxOut? witnessUtxo;
  final Uint8List? redeemScript;
  final Uint8List? witnessScript;

  PsbtInput({this.witnessUtxo, this.redeemScript, this.witnessScript});
}

class FfiConverterPsbtInput {
  static PsbtInput lift(RustBuffer buf) {
    return FfiConverterPsbtInput.read(buf.asUint8List()).value;
  }

  static LiftRetVal<PsbtInput> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final witnessUtxo_lifted = FfiConverterOptionalTxOut.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final witnessUtxo = witnessUtxo_lifted.value;
    new_offset += witnessUtxo_lifted.bytesRead;
    final redeemScript_lifted = FfiConverterOptionalUint8List.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final redeemScript = redeemScript_lifted.value;
    new_offset += redeemScript_lifted.bytesRead;
    final witnessScript_lifted = FfiConverterOptionalUint8List.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final witnessScript = witnessScript_lifted.value;
    new_offset += witnessScript_lifted.bytesRead;
    return LiftRetVal(
      PsbtInput(
        witnessUtxo: witnessUtxo,
        redeemScript: redeemScript,
        witnessScript: witnessScript,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(PsbtInput value) {
    final total_length =
        FfiConverterOptionalTxOut.allocationSize(value.witnessUtxo) +
        FfiConverterOptionalUint8List.allocationSize(value.redeemScript) +
        FfiConverterOptionalUint8List.allocationSize(value.witnessScript) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(PsbtInput value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterOptionalTxOut.write(
      value.witnessUtxo,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUint8List.write(
      value.redeemScript,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUint8List.write(
      value.witnessScript,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(PsbtInput value) {
    return FfiConverterOptionalTxOut.allocationSize(value.witnessUtxo) +
        FfiConverterOptionalUint8List.allocationSize(value.redeemScript) +
        FfiConverterOptionalUint8List.allocationSize(value.witnessScript) +
        0;
  }
}

class RequestResponse {
  final Request request;
  final ClientResponse clientResponse;

  RequestResponse({required this.request, required this.clientResponse});
}

class FfiConverterRequestResponse {
  static RequestResponse lift(RustBuffer buf) {
    return FfiConverterRequestResponse.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RequestResponse> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final request_lifted = FfiConverterRequest.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final request = request_lifted.value;
    new_offset += request_lifted.bytesRead;
    final clientResponse_lifted = ClientResponse.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final clientResponse = clientResponse_lifted.value;
    new_offset += clientResponse_lifted.bytesRead;
    return LiftRetVal(
      RequestResponse(request: request, clientResponse: clientResponse),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(RequestResponse value) {
    final total_length =
        FfiConverterRequest.allocationSize(value.request) +
        ClientResponse.allocationSize(value.clientResponse) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(RequestResponse value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterRequest.write(
      value.request,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += ClientResponse.write(
      value.clientResponse,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(RequestResponse value) {
    return FfiConverterRequest.allocationSize(value.request) +
        ClientResponse.allocationSize(value.clientResponse) +
        0;
  }
}

class TxIn {
  final OutPoint previousOutput;
  final Uint8List scriptSig;
  final int sequence;
  final List<Uint8List> witness;

  TxIn({
    required this.previousOutput,
    required this.scriptSig,
    required this.sequence,
    required this.witness,
  });
}

class FfiConverterTxIn {
  static TxIn lift(RustBuffer buf) {
    return FfiConverterTxIn.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TxIn> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final previousOutput_lifted = FfiConverterOutPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final previousOutput = previousOutput_lifted.value;
    new_offset += previousOutput_lifted.bytesRead;
    final scriptSig_lifted = FfiConverterUint8List.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final scriptSig = scriptSig_lifted.value;
    new_offset += scriptSig_lifted.bytesRead;
    final sequence_lifted = FfiConverterUInt32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final sequence = sequence_lifted.value;
    new_offset += sequence_lifted.bytesRead;
    final witness_lifted = FfiConverterSequenceUint8List.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final witness = witness_lifted.value;
    new_offset += witness_lifted.bytesRead;
    return LiftRetVal(
      TxIn(
        previousOutput: previousOutput,
        scriptSig: scriptSig,
        sequence: sequence,
        witness: witness,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(TxIn value) {
    final total_length =
        FfiConverterOutPoint.allocationSize(value.previousOutput) +
        FfiConverterUint8List.allocationSize(value.scriptSig) +
        FfiConverterUInt32.allocationSize(value.sequence) +
        FfiConverterSequenceUint8List.allocationSize(value.witness) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(TxIn value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterOutPoint.write(
      value.previousOutput,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUint8List.write(
      value.scriptSig,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt32.write(
      value.sequence,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceUint8List.write(
      value.witness,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(TxIn value) {
    return FfiConverterOutPoint.allocationSize(value.previousOutput) +
        FfiConverterUint8List.allocationSize(value.scriptSig) +
        FfiConverterUInt32.allocationSize(value.sequence) +
        FfiConverterSequenceUint8List.allocationSize(value.witness) +
        0;
  }
}

class TxOut {
  final int valueSat;
  final Uint8List scriptPubkey;

  TxOut({required this.valueSat, required this.scriptPubkey});
}

class FfiConverterTxOut {
  static TxOut lift(RustBuffer buf) {
    return FfiConverterTxOut.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TxOut> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final valueSat_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final valueSat = valueSat_lifted.value;
    new_offset += valueSat_lifted.bytesRead;
    final scriptPubkey_lifted = FfiConverterUint8List.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final scriptPubkey = scriptPubkey_lifted.value;
    new_offset += scriptPubkey_lifted.bytesRead;
    return LiftRetVal(
      TxOut(valueSat: valueSat, scriptPubkey: scriptPubkey),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(TxOut value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.valueSat) +
        FfiConverterUint8List.allocationSize(value.scriptPubkey) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(TxOut value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterUInt64.write(
      value.valueSat,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUint8List.write(
      value.scriptPubkey,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(TxOut value) {
    return FfiConverterUInt64.allocationSize(value.valueSat) +
        FfiConverterUint8List.allocationSize(value.scriptPubkey) +
        0;
  }
}

class Weight {
  final int weightUnits;

  Weight({required this.weightUnits});
}

class FfiConverterWeight {
  static Weight lift(RustBuffer buf) {
    return FfiConverterWeight.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Weight> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final weightUnits_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final weightUnits = weightUnits_lifted.value;
    new_offset += weightUnits_lifted.bytesRead;
    return LiftRetVal(
      Weight(weightUnits: weightUnits),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Weight value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.weightUnits) + 0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Weight value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterUInt64.write(
      value.weightUnits,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Weight value) {
    return FfiConverterUInt64.allocationSize(value.weightUnits) + 0;
  }
}

class Request {
  final String url;
  final String contentType;
  final Uint8List body;

  Request({required this.url, required this.contentType, required this.body});
}

class FfiConverterRequest {
  static Request lift(RustBuffer buf) {
    return FfiConverterRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Request> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final url_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final url = url_lifted.value;
    new_offset += url_lifted.bytesRead;
    final contentType_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final contentType = contentType_lifted.value;
    new_offset += contentType_lifted.bytesRead;
    final body_lifted = FfiConverterUint8List.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final body = body_lifted.value;
    new_offset += body_lifted.bytesRead;
    return LiftRetVal(
      Request(url: url, contentType: contentType, body: body),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Request value) {
    final total_length =
        FfiConverterString.allocationSize(value.url) +
        FfiConverterString.allocationSize(value.contentType) +
        FfiConverterUint8List.allocationSize(value.body) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Request value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterString.write(
      value.url,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterString.write(
      value.contentType,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUint8List.write(
      value.body,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Request value) {
    return FfiConverterString.allocationSize(value.url) +
        FfiConverterString.allocationSize(value.contentType) +
        FfiConverterUint8List.allocationSize(value.body) +
        0;
  }
}

class RequestOhttpContext {
  final Request request;
  final ClientResponse ohttpCtx;

  RequestOhttpContext({required this.request, required this.ohttpCtx});
}

class FfiConverterRequestOhttpContext {
  static RequestOhttpContext lift(RustBuffer buf) {
    return FfiConverterRequestOhttpContext.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RequestOhttpContext> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final request_lifted = FfiConverterRequest.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final request = request_lifted.value;
    new_offset += request_lifted.bytesRead;
    final ohttpCtx_lifted = ClientResponse.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final ohttpCtx = ohttpCtx_lifted.value;
    new_offset += ohttpCtx_lifted.bytesRead;
    return LiftRetVal(
      RequestOhttpContext(request: request, ohttpCtx: ohttpCtx),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(RequestOhttpContext value) {
    final total_length =
        FfiConverterRequest.allocationSize(value.request) +
        ClientResponse.allocationSize(value.ohttpCtx) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(RequestOhttpContext value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterRequest.write(
      value.request,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += ClientResponse.write(
      value.ohttpCtx,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(RequestOhttpContext value) {
    return FfiConverterRequest.allocationSize(value.request) +
        ClientResponse.allocationSize(value.ohttpCtx) +
        0;
  }
}

class RequestV1Context {
  final Request request;
  final V1Context context;

  RequestV1Context({required this.request, required this.context});
}

class FfiConverterRequestV1Context {
  static RequestV1Context lift(RustBuffer buf) {
    return FfiConverterRequestV1Context.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RequestV1Context> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final request_lifted = FfiConverterRequest.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final request = request_lifted.value;
    new_offset += request_lifted.bytesRead;
    final context_lifted = V1Context.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final context = context_lifted.value;
    new_offset += context_lifted.bytesRead;
    return LiftRetVal(
      RequestV1Context(request: request, context: context),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(RequestV1Context value) {
    final total_length =
        FfiConverterRequest.allocationSize(value.request) +
        V1Context.allocationSize(value.context) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(RequestV1Context value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    new_offset += FfiConverterRequest.write(
      value.request,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += V1Context.write(
      value.context,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(RequestV1Context value) {
    return FfiConverterRequest.allocationSize(value.request) +
        V1Context.allocationSize(value.context) +
        0;
  }
}

abstract class FfiValidationException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterFfiValidationException {
  static FfiValidationException lift(RustBuffer buffer) {
    return FfiConverterFfiValidationException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<FfiValidationException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = AmountOutOfRangeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = ScriptEmptyFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = ScriptTooLargeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = WitnessItemsTooManyFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = WitnessItemTooLargeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 6:
        final lifted = WitnessTooLargeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 7:
        final lifted = WeightOutOfRangeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 8:
        final lifted = FeeRateOutOfRangeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 9:
        final lifted = ExpirationOutOfRangeFfiValidationException.read(subview);
        return LiftRetVal<FfiValidationException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(FfiValidationException value) {
    return value.lower();
  }

  static int allocationSize(FfiValidationException value) {
    return value.allocationSize();
  }

  static int write(FfiValidationException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class AmountOutOfRangeFfiValidationException extends FfiValidationException {
  final int amountSat;
  final int maxSat;

  AmountOutOfRangeFfiValidationException({
    required int this.amountSat,
    required int this.maxSat,
  });

  AmountOutOfRangeFfiValidationException._(int this.amountSat, int this.maxSat);

  static LiftRetVal<AmountOutOfRangeFfiValidationException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final amountSat_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final amountSat = amountSat_lifted.value;
    new_offset += amountSat_lifted.bytesRead;
    final maxSat_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final maxSat = maxSat_lifted.value;
    new_offset += maxSat_lifted.bytesRead;
    return LiftRetVal(
      AmountOutOfRangeFfiValidationException._(amountSat, maxSat),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(amountSat) +
        FfiConverterUInt64.allocationSize(maxSat) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      amountSat,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      maxSat,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "AmountOutOfRangeFfiValidationException($amountSat, $maxSat)";
  }
}

class ScriptEmptyFfiValidationException extends FfiValidationException {
  final String field;

  ScriptEmptyFfiValidationException(String this.field);

  ScriptEmptyFfiValidationException._(String this.field);

  static LiftRetVal<ScriptEmptyFfiValidationException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final field_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final field = field_lifted.value;
    new_offset += field_lifted.bytesRead;
    return LiftRetVal(ScriptEmptyFfiValidationException._(field), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(field) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      field,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ScriptEmptyFfiValidationException($field)";
  }
}

class ScriptTooLargeFfiValidationException extends FfiValidationException {
  final String field;
  final int len;
  final int max;

  ScriptTooLargeFfiValidationException({
    required String this.field,
    required int this.len,
    required int this.max,
  });

  ScriptTooLargeFfiValidationException._(
    String this.field,
    int this.len,
    int this.max,
  );

  static LiftRetVal<ScriptTooLargeFfiValidationException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final field_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final field = field_lifted.value;
    new_offset += field_lifted.bytesRead;
    final len_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final len = len_lifted.value;
    new_offset += len_lifted.bytesRead;
    final max_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final max = max_lifted.value;
    new_offset += max_lifted.bytesRead;
    return LiftRetVal(
      ScriptTooLargeFfiValidationException._(field, len, max),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(field) +
        FfiConverterUInt64.allocationSize(len) +
        FfiConverterUInt64.allocationSize(max) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      field,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      len,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      max,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ScriptTooLargeFfiValidationException($field, $len, $max)";
  }
}

class WitnessItemsTooManyFfiValidationException extends FfiValidationException {
  final int count;
  final int max;

  WitnessItemsTooManyFfiValidationException({
    required int this.count,
    required int this.max,
  });

  WitnessItemsTooManyFfiValidationException._(int this.count, int this.max);

  static LiftRetVal<WitnessItemsTooManyFfiValidationException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final count_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final count = count_lifted.value;
    new_offset += count_lifted.bytesRead;
    final max_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final max = max_lifted.value;
    new_offset += max_lifted.bytesRead;
    return LiftRetVal(
      WitnessItemsTooManyFfiValidationException._(count, max),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(count) +
        FfiConverterUInt64.allocationSize(max) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      count,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      max,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "WitnessItemsTooManyFfiValidationException($count, $max)";
  }
}

class WitnessItemTooLargeFfiValidationException extends FfiValidationException {
  final int index;
  final int len;
  final int max;

  WitnessItemTooLargeFfiValidationException({
    required int this.index,
    required int this.len,
    required int this.max,
  });

  WitnessItemTooLargeFfiValidationException._(
    int this.index,
    int this.len,
    int this.max,
  );

  static LiftRetVal<WitnessItemTooLargeFfiValidationException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final index_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final index = index_lifted.value;
    new_offset += index_lifted.bytesRead;
    final len_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final len = len_lifted.value;
    new_offset += len_lifted.bytesRead;
    final max_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final max = max_lifted.value;
    new_offset += max_lifted.bytesRead;
    return LiftRetVal(
      WitnessItemTooLargeFfiValidationException._(index, len, max),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(index) +
        FfiConverterUInt64.allocationSize(len) +
        FfiConverterUInt64.allocationSize(max) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      index,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      len,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      max,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "WitnessItemTooLargeFfiValidationException($index, $len, $max)";
  }
}

class WitnessTooLargeFfiValidationException extends FfiValidationException {
  final int len;
  final int max;

  WitnessTooLargeFfiValidationException({
    required int this.len,
    required int this.max,
  });

  WitnessTooLargeFfiValidationException._(int this.len, int this.max);

  static LiftRetVal<WitnessTooLargeFfiValidationException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final len_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final len = len_lifted.value;
    new_offset += len_lifted.bytesRead;
    final max_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final max = max_lifted.value;
    new_offset += max_lifted.bytesRead;
    return LiftRetVal(
      WitnessTooLargeFfiValidationException._(len, max),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(len) +
        FfiConverterUInt64.allocationSize(max) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 6);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      len,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      max,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "WitnessTooLargeFfiValidationException($len, $max)";
  }
}

class WeightOutOfRangeFfiValidationException extends FfiValidationException {
  final int weightUnits;
  final int maxWu;

  WeightOutOfRangeFfiValidationException({
    required int this.weightUnits,
    required int this.maxWu,
  });

  WeightOutOfRangeFfiValidationException._(
    int this.weightUnits,
    int this.maxWu,
  );

  static LiftRetVal<WeightOutOfRangeFfiValidationException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final weightUnits_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final weightUnits = weightUnits_lifted.value;
    new_offset += weightUnits_lifted.bytesRead;
    final maxWu_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final maxWu = maxWu_lifted.value;
    new_offset += maxWu_lifted.bytesRead;
    return LiftRetVal(
      WeightOutOfRangeFfiValidationException._(weightUnits, maxWu),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(weightUnits) +
        FfiConverterUInt64.allocationSize(maxWu) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 7);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      weightUnits,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      maxWu,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "WeightOutOfRangeFfiValidationException($weightUnits, $maxWu)";
  }
}

class FeeRateOutOfRangeFfiValidationException extends FfiValidationException {
  final int value;
  final String unit;

  FeeRateOutOfRangeFfiValidationException({
    required int this.value,
    required String this.unit,
  });

  FeeRateOutOfRangeFfiValidationException._(int this.value, String this.unit);

  static LiftRetVal<FeeRateOutOfRangeFfiValidationException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final value_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    final unit_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final unit = unit_lifted.value;
    new_offset += unit_lifted.bytesRead;
    return LiftRetVal(
      FeeRateOutOfRangeFfiValidationException._(value, unit),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(value) +
        FfiConverterString.allocationSize(unit) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 8);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterString.write(
      unit,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "FeeRateOutOfRangeFfiValidationException($value, $unit)";
  }
}

class ExpirationOutOfRangeFfiValidationException
    extends FfiValidationException {
  final int seconds;
  final int max;

  ExpirationOutOfRangeFfiValidationException({
    required int this.seconds,
    required int this.max,
  });

  ExpirationOutOfRangeFfiValidationException._(int this.seconds, int this.max);

  static LiftRetVal<ExpirationOutOfRangeFfiValidationException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final seconds_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final seconds = seconds_lifted.value;
    new_offset += seconds_lifted.bytesRead;
    final max_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final max = max_lifted.value;
    new_offset += max_lifted.bytesRead;
    return LiftRetVal(
      ExpirationOutOfRangeFfiValidationException._(seconds, max),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(seconds) +
        FfiConverterUInt64.allocationSize(max) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 9);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterUInt64.write(
      seconds,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      max,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ExpirationOutOfRangeFfiValidationException($seconds, $max)";
  }
}

class FfiValidationExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterFfiValidationException.lift(errorBuf);
  }
}

final FfiValidationExceptionErrorHandler ffiValidationExceptionErrorHandler =
    FfiValidationExceptionErrorHandler();

abstract class ForeignException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterForeignException {
  static ForeignException lift(RustBuffer buffer) {
    return FfiConverterForeignException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<ForeignException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = InternalExceptionForeignException.read(subview);
        return LiftRetVal<ForeignException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ForeignException value) {
    return value.lower();
  }

  static int allocationSize(ForeignException value) {
    return value.allocationSize();
  }

  static int write(ForeignException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class InternalExceptionForeignException extends ForeignException {
  final String v0;

  InternalExceptionForeignException(String this.v0);

  InternalExceptionForeignException._(String this.v0);

  static LiftRetVal<InternalExceptionForeignException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(InternalExceptionForeignException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "InternalExceptionForeignException($v0)";
  }
}

class ForeignExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterForeignException.lift(errorBuf);
  }
}

final ForeignExceptionErrorHandler foreignExceptionErrorHandler =
    ForeignExceptionErrorHandler();

enum OutputSubstitution { enabled, disabled }

class FfiConverterOutputSubstitution {
  static LiftRetVal<OutputSubstitution> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(OutputSubstitution.enabled, 4);
      case 2:
        return LiftRetVal(OutputSubstitution.disabled, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static OutputSubstitution lift(RustBuffer buffer) {
    return FfiConverterOutputSubstitution.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(OutputSubstitution input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(OutputSubstitution _value) {
    return 4;
  }

  static int write(OutputSubstitution value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class InitializedTransitionOutcome {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterInitializedTransitionOutcome {
  static InitializedTransitionOutcome lift(RustBuffer buffer) {
    return FfiConverterInitializedTransitionOutcome.read(
      buffer.asUint8List(),
    ).value;
  }

  static LiftRetVal<InitializedTransitionOutcome> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ProgressInitializedTransitionOutcome.read(subview);
        return LiftRetVal<InitializedTransitionOutcome>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = StasisInitializedTransitionOutcome.read(subview);
        return LiftRetVal<InitializedTransitionOutcome>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(InitializedTransitionOutcome value) {
    return value.lower();
  }

  static int allocationSize(InitializedTransitionOutcome value) {
    return value.allocationSize();
  }

  static int write(InitializedTransitionOutcome value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ProgressInitializedTransitionOutcome
    extends InitializedTransitionOutcome {
  final UncheckedOriginalPayload inner;

  ProgressInitializedTransitionOutcome(UncheckedOriginalPayload this.inner);

  ProgressInitializedTransitionOutcome._(UncheckedOriginalPayload this.inner);

  static LiftRetVal<ProgressInitializedTransitionOutcome> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = UncheckedOriginalPayload.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(
      ProgressInitializedTransitionOutcome._(inner),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return UncheckedOriginalPayload.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += UncheckedOriginalPayload.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class StasisInitializedTransitionOutcome extends InitializedTransitionOutcome {
  final Initialized inner;

  StasisInitializedTransitionOutcome(Initialized this.inner);

  StasisInitializedTransitionOutcome._(Initialized this.inner);

  static LiftRetVal<StasisInitializedTransitionOutcome> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = Initialized.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(StasisInitializedTransitionOutcome._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return Initialized.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += Initialized.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

abstract class ReceiveSession {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterReceiveSession {
  static ReceiveSession lift(RustBuffer buffer) {
    return FfiConverterReceiveSession.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<ReceiveSession> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = InitializedReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = UncheckedOriginalPayloadReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = MaybeInputsOwnedReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = MaybeInputsSeenReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = OutputsUnknownReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 6:
        final lifted = WantsOutputsReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 7:
        final lifted = WantsInputsReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 8:
        final lifted = WantsFeeRangeReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 9:
        final lifted = ProvisionalProposalReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 10:
        final lifted = PayjoinProposalReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 11:
        final lifted = HasReplyableExceptionReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 12:
        final lifted = MonitorReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 13:
        final lifted = ReceiverPendingFallbackReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 14:
        final lifted = ClosedReceiveSession.read(subview);
        return LiftRetVal<ReceiveSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ReceiveSession value) {
    return value.lower();
  }

  static int allocationSize(ReceiveSession value) {
    return value.allocationSize();
  }

  static int write(ReceiveSession value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class InitializedReceiveSession extends ReceiveSession {
  final Initialized inner;

  InitializedReceiveSession(Initialized this.inner);

  InitializedReceiveSession._(Initialized this.inner);

  static LiftRetVal<InitializedReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = Initialized.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(InitializedReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return Initialized.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += Initialized.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class UncheckedOriginalPayloadReceiveSession extends ReceiveSession {
  final UncheckedOriginalPayload inner;

  UncheckedOriginalPayloadReceiveSession(UncheckedOriginalPayload this.inner);

  UncheckedOriginalPayloadReceiveSession._(UncheckedOriginalPayload this.inner);

  static LiftRetVal<UncheckedOriginalPayloadReceiveSession> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = UncheckedOriginalPayload.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(
      UncheckedOriginalPayloadReceiveSession._(inner),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return UncheckedOriginalPayload.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += UncheckedOriginalPayload.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class MaybeInputsOwnedReceiveSession extends ReceiveSession {
  final MaybeInputsOwned inner;

  MaybeInputsOwnedReceiveSession(MaybeInputsOwned this.inner);

  MaybeInputsOwnedReceiveSession._(MaybeInputsOwned this.inner);

  static LiftRetVal<MaybeInputsOwnedReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = MaybeInputsOwned.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(MaybeInputsOwnedReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return MaybeInputsOwned.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += MaybeInputsOwned.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class MaybeInputsSeenReceiveSession extends ReceiveSession {
  final MaybeInputsSeen inner;

  MaybeInputsSeenReceiveSession(MaybeInputsSeen this.inner);

  MaybeInputsSeenReceiveSession._(MaybeInputsSeen this.inner);

  static LiftRetVal<MaybeInputsSeenReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = MaybeInputsSeen.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(MaybeInputsSeenReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return MaybeInputsSeen.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += MaybeInputsSeen.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class OutputsUnknownReceiveSession extends ReceiveSession {
  final OutputsUnknown inner;

  OutputsUnknownReceiveSession(OutputsUnknown this.inner);

  OutputsUnknownReceiveSession._(OutputsUnknown this.inner);

  static LiftRetVal<OutputsUnknownReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = OutputsUnknown.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(OutputsUnknownReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return OutputsUnknown.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += OutputsUnknown.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class WantsOutputsReceiveSession extends ReceiveSession {
  final WantsOutputs inner;

  WantsOutputsReceiveSession(WantsOutputs this.inner);

  WantsOutputsReceiveSession._(WantsOutputs this.inner);

  static LiftRetVal<WantsOutputsReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = WantsOutputs.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(WantsOutputsReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return WantsOutputs.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 6);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += WantsOutputs.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class WantsInputsReceiveSession extends ReceiveSession {
  final WantsInputs inner;

  WantsInputsReceiveSession(WantsInputs this.inner);

  WantsInputsReceiveSession._(WantsInputs this.inner);

  static LiftRetVal<WantsInputsReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = WantsInputs.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(WantsInputsReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return WantsInputs.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 7);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += WantsInputs.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class WantsFeeRangeReceiveSession extends ReceiveSession {
  final WantsFeeRange inner;

  WantsFeeRangeReceiveSession(WantsFeeRange this.inner);

  WantsFeeRangeReceiveSession._(WantsFeeRange this.inner);

  static LiftRetVal<WantsFeeRangeReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = WantsFeeRange.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(WantsFeeRangeReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return WantsFeeRange.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 8);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += WantsFeeRange.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class ProvisionalProposalReceiveSession extends ReceiveSession {
  final ProvisionalProposal inner;

  ProvisionalProposalReceiveSession(ProvisionalProposal this.inner);

  ProvisionalProposalReceiveSession._(ProvisionalProposal this.inner);

  static LiftRetVal<ProvisionalProposalReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = ProvisionalProposal.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(ProvisionalProposalReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ProvisionalProposal.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 9);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ProvisionalProposal.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class PayjoinProposalReceiveSession extends ReceiveSession {
  final PayjoinProposal inner;

  PayjoinProposalReceiveSession(PayjoinProposal this.inner);

  PayjoinProposalReceiveSession._(PayjoinProposal this.inner);

  static LiftRetVal<PayjoinProposalReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = PayjoinProposal.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(PayjoinProposalReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return PayjoinProposal.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 10);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += PayjoinProposal.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class HasReplyableExceptionReceiveSession extends ReceiveSession {
  final HasReplyableException inner;

  HasReplyableExceptionReceiveSession(HasReplyableException this.inner);

  HasReplyableExceptionReceiveSession._(HasReplyableException this.inner);

  static LiftRetVal<HasReplyableExceptionReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = HasReplyableException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(HasReplyableExceptionReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return HasReplyableException.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 11);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += HasReplyableException.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class MonitorReceiveSession extends ReceiveSession {
  final Monitor inner;

  MonitorReceiveSession(Monitor this.inner);

  MonitorReceiveSession._(Monitor this.inner);

  static LiftRetVal<MonitorReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = Monitor.read(Uint8List.view(buf.buffer, new_offset));
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(MonitorReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return Monitor.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 12);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += Monitor.write(inner, Uint8List.view(buf.buffer, new_offset));

    return new_offset;
  }
}

class ReceiverPendingFallbackReceiveSession extends ReceiveSession {
  final ReceiverPendingFallback inner;

  ReceiverPendingFallbackReceiveSession(ReceiverPendingFallback this.inner);

  ReceiverPendingFallbackReceiveSession._(ReceiverPendingFallback this.inner);

  static LiftRetVal<ReceiverPendingFallbackReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = ReceiverPendingFallback.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(
      ReceiverPendingFallbackReceiveSession._(inner),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ReceiverPendingFallback.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 13);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ReceiverPendingFallback.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class ClosedReceiveSession extends ReceiveSession {
  final ReceiverSessionOutcome inner;

  ClosedReceiveSession(ReceiverSessionOutcome this.inner);

  ClosedReceiveSession._(ReceiverSessionOutcome this.inner);

  static LiftRetVal<ClosedReceiveSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = ReceiverSessionOutcome.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(ClosedReceiveSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ReceiverSessionOutcome.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 14);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ReceiverSessionOutcome.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

abstract class InputPairException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterInputPairException {
  static InputPairException lift(RustBuffer buffer) {
    return FfiConverterInputPairException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<InputPairException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = InvalidOutPointInputPairException.read(subview);
        return LiftRetVal<InputPairException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = InvalidPsbtInputInputPairException.read(subview);
        return LiftRetVal<InputPairException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = FfiValidationInputPairException.read(subview);
        return LiftRetVal<InputPairException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(InputPairException value) {
    return value.lower();
  }

  static int allocationSize(InputPairException value) {
    return value.allocationSize();
  }

  static int write(InputPairException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class InvalidOutPointInputPairException extends InputPairException {
  final String txid;
  final int vout;

  InvalidOutPointInputPairException({
    required String this.txid,
    required int this.vout,
  });

  InvalidOutPointInputPairException._(String this.txid, int this.vout);

  static LiftRetVal<InvalidOutPointInputPairException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final txid_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final txid = txid_lifted.value;
    new_offset += txid_lifted.bytesRead;
    final vout_lifted = FfiConverterUInt32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vout = vout_lifted.value;
    new_offset += vout_lifted.bytesRead;
    return LiftRetVal(
      InvalidOutPointInputPairException._(txid, vout),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(txid) +
        FfiConverterUInt32.allocationSize(vout) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      txid,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt32.write(
      vout,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "InvalidOutPointInputPairException($txid, $vout)";
  }
}

class InvalidPsbtInputInputPairException extends InputPairException {
  final PsbtInputException v0;

  InvalidPsbtInputInputPairException(PsbtInputException this.v0);

  InvalidPsbtInputInputPairException._(PsbtInputException this.v0);

  static LiftRetVal<InvalidPsbtInputInputPairException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = PsbtInputException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(InvalidPsbtInputInputPairException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return PsbtInputException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += PsbtInputException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "InvalidPsbtInputInputPairException($v0)";
  }
}

class FfiValidationInputPairException extends InputPairException {
  final FfiValidationException v0;

  FfiValidationInputPairException(FfiValidationException this.v0);

  FfiValidationInputPairException._(FfiValidationException this.v0);

  static LiftRetVal<FfiValidationInputPairException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterFfiValidationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(FfiValidationInputPairException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFfiValidationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterFfiValidationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "FfiValidationInputPairException($v0)";
  }
}

class InputPairExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterInputPairException.lift(errorBuf);
  }
}

final InputPairExceptionErrorHandler inputPairExceptionErrorHandler =
    InputPairExceptionErrorHandler();

abstract class OutputSubstitutionException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterOutputSubstitutionException {
  static OutputSubstitutionException lift(RustBuffer buffer) {
    return FfiConverterOutputSubstitutionException.read(
      buffer.asUint8List(),
    ).value;
  }

  static LiftRetVal<OutputSubstitutionException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ProtocolOutputSubstitutionException.read(subview);
        return LiftRetVal<OutputSubstitutionException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FfiValidationOutputSubstitutionException.read(subview);
        return LiftRetVal<OutputSubstitutionException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(OutputSubstitutionException value) {
    return value.lower();
  }

  static int allocationSize(OutputSubstitutionException value) {
    return value.allocationSize();
  }

  static int write(OutputSubstitutionException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ProtocolOutputSubstitutionException extends OutputSubstitutionException {
  final OutputSubstitutionProtocolException v0;

  ProtocolOutputSubstitutionException(
    OutputSubstitutionProtocolException this.v0,
  );

  ProtocolOutputSubstitutionException._(
    OutputSubstitutionProtocolException this.v0,
  );

  static LiftRetVal<ProtocolOutputSubstitutionException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = OutputSubstitutionProtocolException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(ProtocolOutputSubstitutionException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return OutputSubstitutionProtocolException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += OutputSubstitutionProtocolException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ProtocolOutputSubstitutionException($v0)";
  }
}

class FfiValidationOutputSubstitutionException
    extends OutputSubstitutionException {
  final FfiValidationException v0;

  FfiValidationOutputSubstitutionException(FfiValidationException this.v0);

  FfiValidationOutputSubstitutionException._(FfiValidationException this.v0);

  static LiftRetVal<FfiValidationOutputSubstitutionException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterFfiValidationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(
      FfiValidationOutputSubstitutionException._(v0),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFfiValidationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterFfiValidationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "FfiValidationOutputSubstitutionException($v0)";
  }
}

class OutputSubstitutionExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterOutputSubstitutionException.lift(errorBuf);
  }
}

final OutputSubstitutionExceptionErrorHandler
outputSubstitutionExceptionErrorHandler =
    OutputSubstitutionExceptionErrorHandler();

abstract class ReceiverBuilderException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterReceiverBuilderException {
  static ReceiverBuilderException lift(RustBuffer buffer) {
    return FfiConverterReceiverBuilderException.read(
      buffer.asUint8List(),
    ).value;
  }

  static LiftRetVal<ReceiverBuilderException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = InvalidAddressReceiverBuilderException.read(subview);
        return LiftRetVal<ReceiverBuilderException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = IntoUrlReceiverBuilderException.read(subview);
        return LiftRetVal<ReceiverBuilderException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ReceiverBuilderException value) {
    return value.lower();
  }

  static int allocationSize(ReceiverBuilderException value) {
    return value.allocationSize();
  }

  static int write(ReceiverBuilderException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class InvalidAddressReceiverBuilderException extends ReceiverBuilderException {
  final AddressParseException v0;

  InvalidAddressReceiverBuilderException(AddressParseException this.v0);

  InvalidAddressReceiverBuilderException._(AddressParseException this.v0);

  static LiftRetVal<InvalidAddressReceiverBuilderException> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = AddressParseException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(InvalidAddressReceiverBuilderException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return AddressParseException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += AddressParseException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "InvalidAddressReceiverBuilderException($v0)";
  }
}

class IntoUrlReceiverBuilderException extends ReceiverBuilderException {
  final IntoUrlException v0;

  IntoUrlReceiverBuilderException(IntoUrlException this.v0);

  IntoUrlReceiverBuilderException._(IntoUrlException this.v0);

  static LiftRetVal<IntoUrlReceiverBuilderException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = IntoUrlException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(IntoUrlReceiverBuilderException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return IntoUrlException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += IntoUrlException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "IntoUrlReceiverBuilderException($v0)";
  }
}

class ReceiverBuilderExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterReceiverBuilderException.lift(errorBuf);
  }
}

final ReceiverBuilderExceptionErrorHandler
receiverBuilderExceptionErrorHandler = ReceiverBuilderExceptionErrorHandler();

abstract class ReceiverException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterReceiverException {
  static ReceiverException lift(RustBuffer buffer) {
    return FfiConverterReceiverException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<ReceiverException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ProtocolReceiverException.read(subview);
        return LiftRetVal<ReceiverException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = ImplementationReceiverException.read(subview);
        return LiftRetVal<ReceiverException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = IntoUrlReceiverException.read(subview);
        return LiftRetVal<ReceiverException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = UnexpectedReceiverException.read(subview);
        return LiftRetVal<ReceiverException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ReceiverException value) {
    return value.lower();
  }

  static int allocationSize(ReceiverException value) {
    return value.allocationSize();
  }

  static int write(ReceiverException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ProtocolReceiverException extends ReceiverException {
  final ProtocolException v0;

  ProtocolReceiverException(ProtocolException this.v0);

  ProtocolReceiverException._(ProtocolException this.v0);

  static LiftRetVal<ProtocolReceiverException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = ProtocolException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(ProtocolReceiverException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ProtocolException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ProtocolException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ProtocolReceiverException($v0)";
  }
}

class ImplementationReceiverException extends ReceiverException {
  final ImplementationException v0;

  ImplementationReceiverException(ImplementationException this.v0);

  ImplementationReceiverException._(ImplementationException this.v0);

  static LiftRetVal<ImplementationReceiverException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = ImplementationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(ImplementationReceiverException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ImplementationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ImplementationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ImplementationReceiverException($v0)";
  }
}

class IntoUrlReceiverException extends ReceiverException {
  final IntoUrlException v0;

  IntoUrlReceiverException(IntoUrlException this.v0);

  IntoUrlReceiverException._(IntoUrlException this.v0);

  static LiftRetVal<IntoUrlReceiverException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = IntoUrlException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(IntoUrlReceiverException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return IntoUrlException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += IntoUrlException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "IntoUrlReceiverException($v0)";
  }
}

class UnexpectedReceiverException extends ReceiverException {
  UnexpectedReceiverException();

  UnexpectedReceiverException._();

  static LiftRetVal<UnexpectedReceiverException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    return LiftRetVal(UnexpectedReceiverException._(), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;

    return new_offset;
  }

  @override
  String toString() {
    return "UnexpectedReceiverException";
  }
}

class ReceiverExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterReceiverException.lift(errorBuf);
  }
}

final ReceiverExceptionErrorHandler receiverExceptionErrorHandler =
    ReceiverExceptionErrorHandler();

abstract class ReceiverPersistedException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterReceiverPersistedException {
  static ReceiverPersistedException lift(RustBuffer buffer) {
    return FfiConverterReceiverPersistedException.read(
      buffer.asUint8List(),
    ).value;
  }

  static LiftRetVal<ReceiverPersistedException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = TransientReceiverPersistedException.read(subview);
        return LiftRetVal<ReceiverPersistedException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FatalReceiverPersistedException.read(subview);
        return LiftRetVal<ReceiverPersistedException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = StorageReceiverPersistedException.read(subview);
        return LiftRetVal<ReceiverPersistedException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ReceiverPersistedException value) {
    return value.lower();
  }

  static int allocationSize(ReceiverPersistedException value) {
    return value.allocationSize();
  }

  static int write(ReceiverPersistedException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class TransientReceiverPersistedException extends ReceiverPersistedException {
  final ReceiverException v0;

  TransientReceiverPersistedException(ReceiverException this.v0);

  TransientReceiverPersistedException._(ReceiverException this.v0);

  static LiftRetVal<TransientReceiverPersistedException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterReceiverException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(TransientReceiverPersistedException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterReceiverException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterReceiverException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "TransientReceiverPersistedException($v0)";
  }
}

class FatalReceiverPersistedException extends ReceiverPersistedException {
  final ReceiverException v0;

  FatalReceiverPersistedException(ReceiverException this.v0);

  FatalReceiverPersistedException._(ReceiverException this.v0);

  static LiftRetVal<FatalReceiverPersistedException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterReceiverException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(FatalReceiverPersistedException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterReceiverException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterReceiverException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "FatalReceiverPersistedException($v0)";
  }
}

class StorageReceiverPersistedException extends ReceiverPersistedException {
  final ImplementationException v0;

  StorageReceiverPersistedException(ImplementationException this.v0);

  StorageReceiverPersistedException._(ImplementationException this.v0);

  static LiftRetVal<StorageReceiverPersistedException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = ImplementationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(StorageReceiverPersistedException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ImplementationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ImplementationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "StorageReceiverPersistedException($v0)";
  }
}

class ReceiverPersistedExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterReceiverPersistedException.lift(errorBuf);
  }
}

final ReceiverPersistedExceptionErrorHandler
receiverPersistedExceptionErrorHandler =
    ReceiverPersistedExceptionErrorHandler();

abstract class PollingForProposalTransitionOutcome {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterPollingForProposalTransitionOutcome {
  static PollingForProposalTransitionOutcome lift(RustBuffer buffer) {
    return FfiConverterPollingForProposalTransitionOutcome.read(
      buffer.asUint8List(),
    ).value;
  }

  static LiftRetVal<PollingForProposalTransitionOutcome> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ProgressPollingForProposalTransitionOutcome.read(
          subview,
        );
        return LiftRetVal<PollingForProposalTransitionOutcome>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = StasisPollingForProposalTransitionOutcome.read(subview);
        return LiftRetVal<PollingForProposalTransitionOutcome>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(PollingForProposalTransitionOutcome value) {
    return value.lower();
  }

  static int allocationSize(PollingForProposalTransitionOutcome value) {
    return value.allocationSize();
  }

  static int write(PollingForProposalTransitionOutcome value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ProgressPollingForProposalTransitionOutcome
    extends PollingForProposalTransitionOutcome {
  final String psbtBase64;

  ProgressPollingForProposalTransitionOutcome(String this.psbtBase64);

  ProgressPollingForProposalTransitionOutcome._(String this.psbtBase64);

  static LiftRetVal<ProgressPollingForProposalTransitionOutcome> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final psbtBase64_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final psbtBase64 = psbtBase64_lifted.value;
    new_offset += psbtBase64_lifted.bytesRead;
    return LiftRetVal(
      ProgressPollingForProposalTransitionOutcome._(psbtBase64),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(psbtBase64) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      psbtBase64,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class StasisPollingForProposalTransitionOutcome
    extends PollingForProposalTransitionOutcome {
  final PollingForProposal inner;

  StasisPollingForProposalTransitionOutcome(PollingForProposal this.inner);

  StasisPollingForProposalTransitionOutcome._(PollingForProposal this.inner);

  static LiftRetVal<StasisPollingForProposalTransitionOutcome> read(
    Uint8List buf,
  ) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = PollingForProposal.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(
      StasisPollingForProposalTransitionOutcome._(inner),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return PollingForProposal.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += PollingForProposal.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

abstract class SendSession {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterSendSession {
  static SendSession lift(RustBuffer buffer) {
    return FfiConverterSendSession.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<SendSession> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = WithReplyKeySendSession.read(subview);
        return LiftRetVal<SendSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = PollingForProposalSendSession.read(subview);
        return LiftRetVal<SendSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = SenderPendingFallbackSendSession.read(subview);
        return LiftRetVal<SendSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = ClosedSendSession.read(subview);
        return LiftRetVal<SendSession>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(SendSession value) {
    return value.lower();
  }

  static int allocationSize(SendSession value) {
    return value.allocationSize();
  }

  static int write(SendSession value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class WithReplyKeySendSession extends SendSession {
  final WithReplyKey inner;

  WithReplyKeySendSession(WithReplyKey this.inner);

  WithReplyKeySendSession._(WithReplyKey this.inner);

  static LiftRetVal<WithReplyKeySendSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = WithReplyKey.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(WithReplyKeySendSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return WithReplyKey.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += WithReplyKey.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class PollingForProposalSendSession extends SendSession {
  final PollingForProposal inner;

  PollingForProposalSendSession(PollingForProposal this.inner);

  PollingForProposalSendSession._(PollingForProposal this.inner);

  static LiftRetVal<PollingForProposalSendSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = PollingForProposal.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(PollingForProposalSendSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return PollingForProposal.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += PollingForProposal.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class SenderPendingFallbackSendSession extends SendSession {
  final SenderPendingFallback inner;

  SenderPendingFallbackSendSession(SenderPendingFallback this.inner);

  SenderPendingFallbackSendSession._(SenderPendingFallback this.inner);

  static LiftRetVal<SenderPendingFallbackSendSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = SenderPendingFallback.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(SenderPendingFallbackSendSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return SenderPendingFallback.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += SenderPendingFallback.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

class ClosedSendSession extends SendSession {
  final SenderSessionOutcome inner;

  ClosedSendSession(SenderSessionOutcome this.inner);

  ClosedSendSession._(SenderSessionOutcome this.inner);

  static LiftRetVal<ClosedSendSession> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final inner_lifted = SenderSessionOutcome.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final inner = inner_lifted.value;
    new_offset += inner_lifted.bytesRead;
    return LiftRetVal(ClosedSendSession._(inner), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return SenderSessionOutcome.allocationSize(inner) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += SenderSessionOutcome.write(
      inner,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }
}

enum ErrorCode {
  unavailable,
  notEnoughMoney,
  versionUnsupported,
  originalPsbtRejected,
  unrecognized,
}

class FfiConverterErrorCode {
  static LiftRetVal<ErrorCode> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(ErrorCode.unavailable, 4);
      case 2:
        return LiftRetVal(ErrorCode.notEnoughMoney, 4);
      case 3:
        return LiftRetVal(ErrorCode.versionUnsupported, 4);
      case 4:
        return LiftRetVal(ErrorCode.originalPsbtRejected, 4);
      case 5:
        return LiftRetVal(ErrorCode.unrecognized, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static ErrorCode lift(RustBuffer buffer) {
    return FfiConverterErrorCode.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(ErrorCode input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(ErrorCode _value) {
    return 4;
  }

  static int write(ErrorCode value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class PsbtParseException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterPsbtParseException {
  static PsbtParseException lift(RustBuffer buffer) {
    return FfiConverterPsbtParseException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<PsbtParseException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = InvalidPsbtPsbtParseException.read(subview);
        return LiftRetVal<PsbtParseException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(PsbtParseException value) {
    return value.lower();
  }

  static int allocationSize(PsbtParseException value) {
    return value.allocationSize();
  }

  static int write(PsbtParseException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class InvalidPsbtPsbtParseException extends PsbtParseException {
  final String v0;

  InvalidPsbtPsbtParseException(String this.v0);

  InvalidPsbtPsbtParseException._(String this.v0);

  static LiftRetVal<InvalidPsbtPsbtParseException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(InvalidPsbtPsbtParseException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "InvalidPsbtPsbtParseException($v0)";
  }
}

class PsbtParseExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterPsbtParseException.lift(errorBuf);
  }
}

final PsbtParseExceptionErrorHandler psbtParseExceptionErrorHandler =
    PsbtParseExceptionErrorHandler();

abstract class ResponseException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterResponseException {
  static ResponseException lift(RustBuffer buffer) {
    return FfiConverterResponseException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<ResponseException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = WellKnownResponseException.read(subview);
        return LiftRetVal<ResponseException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = ValidationResponseException.read(subview);
        return LiftRetVal<ResponseException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = UnrecognizedResponseException.read(subview);
        return LiftRetVal<ResponseException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ResponseException value) {
    return value.lower();
  }

  static int allocationSize(ResponseException value) {
    return value.allocationSize();
  }

  static int write(ResponseException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class WellKnownResponseException extends ResponseException {
  final WellKnownException v0;

  WellKnownResponseException(WellKnownException this.v0);

  WellKnownResponseException._(WellKnownException this.v0);

  static LiftRetVal<WellKnownResponseException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = WellKnownException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(WellKnownResponseException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return WellKnownException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += WellKnownException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "WellKnownResponseException($v0)";
  }
}

class ValidationResponseException extends ResponseException {
  final ValidationException v0;

  ValidationResponseException(ValidationException this.v0);

  ValidationResponseException._(ValidationException this.v0);

  static LiftRetVal<ValidationResponseException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = ValidationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(ValidationResponseException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ValidationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ValidationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ValidationResponseException($v0)";
  }
}

class UnrecognizedResponseException extends ResponseException {
  final String errorCode;
  final String msg;

  UnrecognizedResponseException({
    required String this.errorCode,
    required String this.msg,
  });

  UnrecognizedResponseException._(String this.errorCode, String this.msg);

  static LiftRetVal<UnrecognizedResponseException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final errorCode_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final errorCode = errorCode_lifted.value;
    new_offset += errorCode_lifted.bytesRead;
    final msg_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final msg = msg_lifted.value;
    new_offset += msg_lifted.bytesRead;
    return LiftRetVal(
      UnrecognizedResponseException._(errorCode, msg),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(errorCode) +
        FfiConverterString.allocationSize(msg) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      errorCode,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterString.write(
      msg,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "UnrecognizedResponseException($errorCode, $msg)";
  }
}

class ResponseExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterResponseException.lift(errorBuf);
  }
}

final ResponseExceptionErrorHandler responseExceptionErrorHandler =
    ResponseExceptionErrorHandler();

abstract class SenderException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterSenderException {
  static SenderException lift(RustBuffer buffer) {
    return FfiConverterSenderException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<SenderException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = DecapsulationSenderException.read(subview);
        return LiftRetVal<SenderException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = ResponseSenderException.read(subview);
        return LiftRetVal<SenderException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = BuildSenderException.read(subview);
        return LiftRetVal<SenderException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = UnexpectedSenderException.read(subview);
        return LiftRetVal<SenderException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(SenderException value) {
    return value.lower();
  }

  static int allocationSize(SenderException value) {
    return value.allocationSize();
  }

  static int write(SenderException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class DecapsulationSenderException extends SenderException {
  final DecapsulationException v0;

  DecapsulationSenderException(DecapsulationException this.v0);

  DecapsulationSenderException._(DecapsulationException this.v0);

  static LiftRetVal<DecapsulationSenderException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = DecapsulationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(DecapsulationSenderException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return DecapsulationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += DecapsulationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "DecapsulationSenderException($v0)";
  }
}

class ResponseSenderException extends SenderException {
  final ResponseException v0;

  ResponseSenderException(ResponseException this.v0);

  ResponseSenderException._(ResponseException this.v0);

  static LiftRetVal<ResponseSenderException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterResponseException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(ResponseSenderException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterResponseException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterResponseException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "ResponseSenderException($v0)";
  }
}

class BuildSenderException extends SenderException {
  final SenderBuilderException v0;

  BuildSenderException(SenderBuilderException this.v0);

  BuildSenderException._(SenderBuilderException this.v0);

  static LiftRetVal<BuildSenderException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = SenderBuilderException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(BuildSenderException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return SenderBuilderException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += SenderBuilderException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "BuildSenderException($v0)";
  }
}

class UnexpectedSenderException extends SenderException {
  UnexpectedSenderException();

  UnexpectedSenderException._();

  static LiftRetVal<UnexpectedSenderException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    return LiftRetVal(UnexpectedSenderException._(), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;

    return new_offset;
  }

  @override
  String toString() {
    return "UnexpectedSenderException";
  }
}

class SenderExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterSenderException.lift(errorBuf);
  }
}

final SenderExceptionErrorHandler senderExceptionErrorHandler =
    SenderExceptionErrorHandler();

abstract class SenderInputException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterSenderInputException {
  static SenderInputException lift(RustBuffer buffer) {
    return FfiConverterSenderInputException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<SenderInputException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = PsbtSenderInputException.read(subview);
        return LiftRetVal<SenderInputException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = BuildSenderInputException.read(subview);
        return LiftRetVal<SenderInputException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = FfiValidationSenderInputException.read(subview);
        return LiftRetVal<SenderInputException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(SenderInputException value) {
    return value.lower();
  }

  static int allocationSize(SenderInputException value) {
    return value.allocationSize();
  }

  static int write(SenderInputException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class PsbtSenderInputException extends SenderInputException {
  final PsbtParseException v0;

  PsbtSenderInputException(PsbtParseException this.v0);

  PsbtSenderInputException._(PsbtParseException this.v0);

  static LiftRetVal<PsbtSenderInputException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterPsbtParseException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(PsbtSenderInputException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterPsbtParseException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterPsbtParseException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "PsbtSenderInputException($v0)";
  }
}

class BuildSenderInputException extends SenderInputException {
  final SenderBuilderException v0;

  BuildSenderInputException(SenderBuilderException this.v0);

  BuildSenderInputException._(SenderBuilderException this.v0);

  static LiftRetVal<BuildSenderInputException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = SenderBuilderException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(BuildSenderInputException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return SenderBuilderException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += SenderBuilderException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "BuildSenderInputException($v0)";
  }
}

class FfiValidationSenderInputException extends SenderInputException {
  final FfiValidationException v0;

  FfiValidationSenderInputException(FfiValidationException this.v0);

  FfiValidationSenderInputException._(FfiValidationException this.v0);

  static LiftRetVal<FfiValidationSenderInputException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterFfiValidationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(FfiValidationSenderInputException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFfiValidationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterFfiValidationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "FfiValidationSenderInputException($v0)";
  }
}

class SenderInputExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterSenderInputException.lift(errorBuf);
  }
}

final SenderInputExceptionErrorHandler senderInputExceptionErrorHandler =
    SenderInputExceptionErrorHandler();

abstract class SenderPersistedException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterSenderPersistedException {
  static SenderPersistedException lift(RustBuffer buffer) {
    return FfiConverterSenderPersistedException.read(
      buffer.asUint8List(),
    ).value;
  }

  static LiftRetVal<SenderPersistedException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = TransientSenderPersistedException.read(subview);
        return LiftRetVal<SenderPersistedException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FatalSenderPersistedException.read(subview);
        return LiftRetVal<SenderPersistedException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = StorageSenderPersistedException.read(subview);
        return LiftRetVal<SenderPersistedException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(SenderPersistedException value) {
    return value.lower();
  }

  static int allocationSize(SenderPersistedException value) {
    return value.allocationSize();
  }

  static int write(SenderPersistedException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class TransientSenderPersistedException extends SenderPersistedException {
  final SenderException v0;

  TransientSenderPersistedException(SenderException this.v0);

  TransientSenderPersistedException._(SenderException this.v0);

  static LiftRetVal<TransientSenderPersistedException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterSenderException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(TransientSenderPersistedException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSenderException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterSenderException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "TransientSenderPersistedException($v0)";
  }
}

class FatalSenderPersistedException extends SenderPersistedException {
  final SenderException v0;

  FatalSenderPersistedException(SenderException this.v0);

  FatalSenderPersistedException._(SenderException this.v0);

  static LiftRetVal<FatalSenderPersistedException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterSenderException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(FatalSenderPersistedException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSenderException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterSenderException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "FatalSenderPersistedException($v0)";
  }
}

class StorageSenderPersistedException extends SenderPersistedException {
  final ImplementationException v0;

  StorageSenderPersistedException(ImplementationException this.v0);

  StorageSenderPersistedException._(ImplementationException this.v0);

  static LiftRetVal<StorageSenderPersistedException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = ImplementationException.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(StorageSenderPersistedException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return ImplementationException.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += ImplementationException.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "StorageSenderPersistedException($v0)";
  }
}

class SenderPersistedExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterSenderPersistedException.lift(errorBuf);
  }
}

final SenderPersistedExceptionErrorHandler
senderPersistedExceptionErrorHandler = SenderPersistedExceptionErrorHandler();

abstract class FfiException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterFfiException {
  static FfiException lift(RustBuffer buffer) {
    return FfiConverterFfiException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<FfiException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = InitExceptionFfiException.read(subview);
        return LiftRetVal<FfiException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = RpcExceptionFfiException.read(subview);
        return LiftRetVal<FfiException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = MessageFfiException.read(subview);
        return LiftRetVal<FfiException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(FfiException value) {
    return value.lower();
  }

  static int allocationSize(FfiException value) {
    return value.allocationSize();
  }

  static int write(FfiException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class InitExceptionFfiException extends FfiException {
  final String v0;

  InitExceptionFfiException(String this.v0);

  InitExceptionFfiException._(String this.v0);

  static LiftRetVal<InitExceptionFfiException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(InitExceptionFfiException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "InitExceptionFfiException($v0)";
  }
}

class RpcExceptionFfiException extends FfiException {
  final String v0;

  RpcExceptionFfiException(String this.v0);

  RpcExceptionFfiException._(String this.v0);

  static LiftRetVal<RpcExceptionFfiException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(RpcExceptionFfiException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "RpcExceptionFfiException($v0)";
  }
}

class MessageFfiException extends FfiException {
  final String v0;

  MessageFfiException(String this.v0);

  MessageFfiException._(String this.v0);

  static LiftRetVal<MessageFfiException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;

    final v0_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final v0 = v0_lifted.value;
    new_offset += v0_lifted.bytesRead;
    return LiftRetVal(MessageFfiException._(v0), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(v0) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;

    new_offset += FfiConverterString.write(
      v0,
      Uint8List.view(buf.buffer, new_offset),
    );

    return new_offset;
  }

  @override
  String toString() {
    return "MessageFfiException($v0)";
  }
}

class FfiExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterFfiException.lift(errorBuf);
  }
}

final FfiExceptionErrorHandler ffiExceptionErrorHandler =
    FfiExceptionErrorHandler();

abstract class ImplementationExceptionInterface {}

final _ImplementationExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_implementationerror(ptr, status),
  );
});

class ImplementationException implements ImplementationExceptionInterface {
  late final Pointer<Void> _ptr;

  ImplementationException._(this._ptr) {
    _ImplementationExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory ImplementationException.lift(Pointer<Void> ptr) {
    return ImplementationException._(ptr);
  }

  static Pointer<Void> lower(ImplementationException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_implementationerror(_ptr, status),
    );
  }

  static int allocationSize(ImplementationException value) {
    return 8;
  }

  static LiftRetVal<ImplementationException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ImplementationException.lift(pointer), 8);
  }

  static int write(ImplementationException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ImplementationExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_implementationerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_implementationerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_implementationerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class SerdeJsonExceptionInterface {}

final _SerdeJsonExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_serdejsonerror(ptr, status));
});

class SerdeJsonException implements SerdeJsonExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  SerdeJsonException._(this._ptr) {
    _SerdeJsonExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory SerdeJsonException.lift(Pointer<Void> ptr) {
    return SerdeJsonException._(ptr);
  }

  static Pointer<Void> lower(SerdeJsonException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_serdejsonerror(_ptr, status),
    );
  }

  static int allocationSize(SerdeJsonException value) {
    return 8;
  }

  static LiftRetVal<SerdeJsonException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SerdeJsonException.lift(pointer), 8);
  }

  static int write(SerdeJsonException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SerdeJsonExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_serdejsonerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_serdejsonerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_serdejsonerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

class SerdeJsonExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return SerdeJsonException.read(errorBuf.asUint8List()).value;
  }
}

final SerdeJsonExceptionErrorHandler serdeJsonExceptionErrorHandler =
    SerdeJsonExceptionErrorHandler();

abstract class ClientResponseInterface {}

final _ClientResponseFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_clientresponse(ptr, status));
});

class ClientResponse implements ClientResponseInterface {
  late final Pointer<Void> _ptr;

  ClientResponse._(this._ptr) {
    _ClientResponseFinalizer.attach(this, _ptr, detach: this);
  }

  factory ClientResponse.lift(Pointer<Void> ptr) {
    return ClientResponse._(ptr);
  }

  static Pointer<Void> lower(ClientResponse value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_clientresponse(_ptr, status),
    );
  }

  static int allocationSize(ClientResponse value) {
    return 8;
  }

  static LiftRetVal<ClientResponse> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ClientResponse.lift(pointer), 8);
  }

  static int write(ClientResponse value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ClientResponseFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_clientresponse(_ptr, status),
    );
  }
}

abstract class OhttpKeysInterface {}

final _OhttpKeysFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_ohttpkeys(ptr, status));
});

class OhttpKeys implements OhttpKeysInterface {
  late final Pointer<Void> _ptr;

  OhttpKeys._(this._ptr) {
    _OhttpKeysFinalizer.attach(this, _ptr, detach: this);
  }

  OhttpKeys.decode({required Uint8List bytes})
    : _ptr = rustCall(
        (status) => uniffi_payjoin_ffi_fn_constructor_ohttpkeys_decode(
          FfiConverterUint8List.lower(bytes),
          status,
        ),
        ohttpExceptionErrorHandler,
      ) {
    _OhttpKeysFinalizer.attach(this, _ptr, detach: this);
  }

  factory OhttpKeys.lift(Pointer<Void> ptr) {
    return OhttpKeys._(ptr);
  }

  static Pointer<Void> lower(OhttpKeys value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_ohttpkeys(_ptr, status),
    );
  }

  static int allocationSize(OhttpKeys value) {
    return 8;
  }

  static LiftRetVal<OhttpKeys> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(OhttpKeys.lift(pointer), 8);
  }

  static int write(OhttpKeys value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _OhttpKeysFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_ohttpkeys(_ptr, status));
  }
}

abstract class OhttpExceptionInterface {}

final _OhttpExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_ohttperror(ptr, status));
});

class OhttpException implements OhttpExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  OhttpException._(this._ptr) {
    _OhttpExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory OhttpException.lift(Pointer<Void> ptr) {
    return OhttpException._(ptr);
  }

  static Pointer<Void> lower(OhttpException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_ohttperror(_ptr, status),
    );
  }

  static int allocationSize(OhttpException value) {
    return 8;
  }

  static LiftRetVal<OhttpException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(OhttpException.lift(pointer), 8);
  }

  static int write(OhttpException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _OhttpExceptionFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_ohttperror(_ptr, status));
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_ohttperror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_ohttperror_uniffi_trait_display(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }
}

class OhttpExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return OhttpException.read(errorBuf.asUint8List()).value;
  }
}

final OhttpExceptionErrorHandler ohttpExceptionErrorHandler =
    OhttpExceptionErrorHandler();

abstract class AssumeInteractiveTransitionInterface {
  MaybeInputsOwned save({required JsonReceiverSessionPersister persister});
  Future<MaybeInputsOwned> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _AssumeInteractiveTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_assumeinteractivetransition(ptr, status),
  );
});

class AssumeInteractiveTransition
    implements AssumeInteractiveTransitionInterface {
  late final Pointer<Void> _ptr;

  AssumeInteractiveTransition._(this._ptr) {
    _AssumeInteractiveTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory AssumeInteractiveTransition.lift(Pointer<Void> ptr) {
    return AssumeInteractiveTransition._(ptr);
  }

  static Pointer<Void> lower(AssumeInteractiveTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_assumeinteractivetransition(_ptr, status),
    );
  }

  static int allocationSize(AssumeInteractiveTransition value) {
    return 8;
  }

  static LiftRetVal<AssumeInteractiveTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(AssumeInteractiveTransition.lift(pointer), 8);
  }

  static int write(AssumeInteractiveTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _AssumeInteractiveTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_assumeinteractivetransition(_ptr, status),
    );
  }

  MaybeInputsOwned save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_assumeinteractivetransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      MaybeInputsOwned.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<MaybeInputsOwned> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_assumeinteractivetransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => MaybeInputsOwned.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class CanBroadcast {
  bool callback(Uint8List tx);
}

class FfiConverterCallbackInterfaceCanBroadcast {
  static final _handleMap = UniffiHandleMap<CanBroadcast>();
  static bool _vtableInitialized = false;

  static CanBroadcast lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _CanBroadcastImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(CanBroadcast value) {
    if (value is _CanBroadcastImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initCanBroadcastVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<CanBroadcast> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(CanBroadcast value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(CanBroadcast value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceCanBroadcastMethod0 =
    Void Function(Uint64, RustBuffer, Pointer<Int8>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceCanBroadcastMethod0Dart =
    void Function(int, RustBuffer, Pointer<Int8>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceCanBroadcastFree = Void Function(Uint64);
typedef UniffiCallbackInterfaceCanBroadcastFreeDart = void Function(int);
typedef UniffiCallbackInterfaceCanBroadcastClone = Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceCanBroadcastCloneDart = int Function(int);

final class _CanBroadcastImpl implements CanBroadcast {
  _CanBroadcastImpl._internal(this._ptr) {
    _CanBroadcastImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>> _CanBroadcastImplFinalizer =
      Finalizer<Pointer<Void>>((ptr) {
        rustCall(
          (status) => uniffi_payjoin_ffi_fn_free_canbroadcast(ptr, status),
        );
      });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_canbroadcast(_ptr, status),
    );
  }

  void dispose() {
    _CanBroadcastImplFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_canbroadcast(_ptr, status));
  }

  @override
  bool callback(Uint8List tx) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_canbroadcast_callback(
        uniffiClonePointer(),
        FfiConverterUint8List.lower(tx),
        status,
      ),
      FfiConverterBool.lift,
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceCanBroadcast extends Struct {
  external Pointer<NativeFunction<UniffiCallbackInterfaceCanBroadcastFree>>
  uniffiFree;
  external Pointer<NativeFunction<UniffiCallbackInterfaceCanBroadcastClone>>
  uniffiClone;
  external Pointer<NativeFunction<UniffiCallbackInterfaceCanBroadcastMethod0>>
  callback;
}

void canBroadcastCallback(
  int uniffiHandle,
  RustBuffer tx,
  Pointer<Int8> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceCanBroadcast._handleMap.get(
      uniffiHandle,
    );
    final arg0 = FfiConverterUint8List.lift(tx);
    final result = obj.callback(arg0);
    outReturn.value = result ? 1 : 0;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceCanBroadcastMethod0>>
canBroadcastCallbackPointer =
    Pointer.fromFunction<UniffiCallbackInterfaceCanBroadcastMethod0>(
      canBroadcastCallback,
    );

void canBroadcastFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceCanBroadcast._handleMap.remove(handle);
  } catch (e) {}
}

final Pointer<NativeFunction<UniffiCallbackInterfaceCanBroadcastFree>>
canBroadcastFreePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceCanBroadcastFree>(
      canBroadcastFreeCallback,
    );

int canBroadcastCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceCanBroadcast._handleMap.get(
      handle,
    );
    final newHandle = FfiConverterCallbackInterfaceCanBroadcast._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceCanBroadcastClone>>
canBroadcastClonePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceCanBroadcastClone>(
      canBroadcastCloneCallback,
      0,
    );
late final Pointer<UniffiVTableCallbackInterfaceCanBroadcast>
canBroadcastVTable;

void initCanBroadcastVTable() {
  if (FfiConverterCallbackInterfaceCanBroadcast._vtableInitialized) {
    return;
  }

  canBroadcastVTable = calloc<UniffiVTableCallbackInterfaceCanBroadcast>();
  canBroadcastVTable.ref.uniffiFree = canBroadcastFreePointer;
  canBroadcastVTable.ref.uniffiClone = canBroadcastClonePointer;
  canBroadcastVTable.ref.callback = canBroadcastCallbackPointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_canbroadcast(canBroadcastVTable);
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceCanBroadcast._vtableInitialized = true;
}

abstract class CancelTransitionInterface {
  ReceiverPendingFallback? save({
    required JsonReceiverSessionPersister persister,
  });
  Future<ReceiverPendingFallback?> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _CancelTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_canceltransition(ptr, status),
  );
});

class CancelTransition implements CancelTransitionInterface {
  late final Pointer<Void> _ptr;

  CancelTransition._(this._ptr) {
    _CancelTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory CancelTransition.lift(Pointer<Void> ptr) {
    return CancelTransition._(ptr);
  }

  static Pointer<Void> lower(CancelTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_canceltransition(_ptr, status),
    );
  }

  static int allocationSize(CancelTransition value) {
    return 8;
  }

  static LiftRetVal<CancelTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(CancelTransition.lift(pointer), 8);
  }

  static int write(CancelTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _CancelTransitionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_canceltransition(_ptr, status),
    );
  }

  ReceiverPendingFallback? save({
    required JsonReceiverSessionPersister persister,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_canceltransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      FfiConverterOptionalReceiverPendingFallback.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<ReceiverPendingFallback?> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_canceltransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_rust_buffer,
      ffi_payjoin_ffi_rust_future_complete_rust_buffer,
      ffi_payjoin_ffi_rust_future_free_rust_buffer,
      FfiConverterOptionalReceiverPendingFallback.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class HasReplyableExceptionInterface {
  CancelTransition cancel();
  RequestResponse createErrorRequest({required String ohttpRelay});
  HasReplyableErrorTransition processErrorResponse({
    required Uint8List body,
    required ClientResponse ohttpContext,
  });
}

final _HasReplyableExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_hasreplyableerror(ptr, status),
  );
});

class HasReplyableException implements HasReplyableExceptionInterface {
  late final Pointer<Void> _ptr;

  HasReplyableException._(this._ptr) {
    _HasReplyableExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory HasReplyableException.lift(Pointer<Void> ptr) {
    return HasReplyableException._(ptr);
  }

  static Pointer<Void> lower(HasReplyableException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_hasreplyableerror(_ptr, status),
    );
  }

  static int allocationSize(HasReplyableException value) {
    return 8;
  }

  static LiftRetVal<HasReplyableException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(HasReplyableException.lift(pointer), 8);
  }

  static int write(HasReplyableException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _HasReplyableExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_hasreplyableerror(_ptr, status),
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_hasreplyableerror_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  RequestResponse createErrorRequest({required String ohttpRelay}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_hasreplyableerror_create_error_request(
            uniffiClonePointer(),
            FfiConverterString.lower(ohttpRelay),
            status,
          ),
      FfiConverterRequestResponse.lift,
      receiverCreateRequestExceptionErrorHandler,
    );
  }

  HasReplyableErrorTransition processErrorResponse({
    required Uint8List body,
    required ClientResponse ohttpContext,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_hasreplyableerror_process_error_response(
            uniffiClonePointer(),
            FfiConverterUint8List.lower(body),
            ClientResponse.lower(ohttpContext),
            status,
          ),
      HasReplyableErrorTransition.lift,
      null,
    );
  }
}

abstract class HasReplyableErrorTransitionInterface {
  ReceiverPendingFallback? save({
    required JsonReceiverSessionPersister persister,
  });
  Future<ReceiverPendingFallback?> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _HasReplyableErrorTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_hasreplyableerrortransition(ptr, status),
  );
});

class HasReplyableErrorTransition
    implements HasReplyableErrorTransitionInterface {
  late final Pointer<Void> _ptr;

  HasReplyableErrorTransition._(this._ptr) {
    _HasReplyableErrorTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory HasReplyableErrorTransition.lift(Pointer<Void> ptr) {
    return HasReplyableErrorTransition._(ptr);
  }

  static Pointer<Void> lower(HasReplyableErrorTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_hasreplyableerrortransition(_ptr, status),
    );
  }

  static int allocationSize(HasReplyableErrorTransition value) {
    return 8;
  }

  static LiftRetVal<HasReplyableErrorTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(HasReplyableErrorTransition.lift(pointer), 8);
  }

  static int write(HasReplyableErrorTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _HasReplyableErrorTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_hasreplyableerrortransition(_ptr, status),
    );
  }

  ReceiverPendingFallback? save({
    required JsonReceiverSessionPersister persister,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_hasreplyableerrortransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      FfiConverterOptionalReceiverPendingFallback.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<ReceiverPendingFallback?> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_hasreplyableerrortransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_rust_buffer,
      ffi_payjoin_ffi_rust_future_complete_rust_buffer,
      ffi_payjoin_ffi_rust_future_free_rust_buffer,
      FfiConverterOptionalReceiverPendingFallback.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class InitialReceiveTransitionInterface {
  Initialized save({required JsonReceiverSessionPersister persister});
  Future<Initialized> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _InitialReceiveTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_initialreceivetransition(ptr, status),
  );
});

class InitialReceiveTransition implements InitialReceiveTransitionInterface {
  late final Pointer<Void> _ptr;

  InitialReceiveTransition._(this._ptr) {
    _InitialReceiveTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory InitialReceiveTransition.lift(Pointer<Void> ptr) {
    return InitialReceiveTransition._(ptr);
  }

  static Pointer<Void> lower(InitialReceiveTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_initialreceivetransition(_ptr, status),
    );
  }

  static int allocationSize(InitialReceiveTransition value) {
    return 8;
  }

  static LiftRetVal<InitialReceiveTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(InitialReceiveTransition.lift(pointer), 8);
  }

  static int write(InitialReceiveTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _InitialReceiveTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_initialreceivetransition(_ptr, status),
    );
  }

  Initialized save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initialreceivetransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      Initialized.lift,
      foreignExceptionErrorHandler,
    );
  }

  Future<Initialized> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_initialreceivetransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => Initialized.lift(Pointer<Void>.fromAddress(ptr)),
      foreignExceptionErrorHandler,
    );
  }
}

abstract class InitializedInterface {
  CancelTransition cancel();
  RequestResponse createPollRequest({required String ohttpRelay});
  PjUri pjUri();
  InitializedTransition processResponse({
    required Uint8List body,
    required ClientResponse ctx,
  });
}

final _InitializedFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_initialized(ptr, status));
});

class Initialized implements InitializedInterface {
  late final Pointer<Void> _ptr;

  Initialized._(this._ptr) {
    _InitializedFinalizer.attach(this, _ptr, detach: this);
  }

  factory Initialized.lift(Pointer<Void> ptr) {
    return Initialized._(ptr);
  }

  static Pointer<Void> lower(Initialized value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_initialized(_ptr, status),
    );
  }

  static int allocationSize(Initialized value) {
    return 8;
  }

  static LiftRetVal<Initialized> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(Initialized.lift(pointer), 8);
  }

  static int write(Initialized value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _InitializedFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_initialized(_ptr, status));
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initialized_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  RequestResponse createPollRequest({required String ohttpRelay}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initialized_create_poll_request(
        uniffiClonePointer(),
        FfiConverterString.lower(ohttpRelay),
        status,
      ),
      FfiConverterRequestResponse.lift,
      receiverCreateRequestExceptionErrorHandler,
    );
  }

  PjUri pjUri() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initialized_pj_uri(
        uniffiClonePointer(),
        status,
      ),
      PjUri.lift,
      null,
    );
  }

  InitializedTransition processResponse({
    required Uint8List body,
    required ClientResponse ctx,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initialized_process_response(
        uniffiClonePointer(),
        FfiConverterUint8List.lower(body),
        ClientResponse.lower(ctx),
        status,
      ),
      InitializedTransition.lift,
      null,
    );
  }
}

abstract class InitializedTransitionInterface {
  InitializedTransitionOutcome save({
    required JsonReceiverSessionPersister persister,
  });
  Future<InitializedTransitionOutcome> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _InitializedTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_initializedtransition(ptr, status),
  );
});

class InitializedTransition implements InitializedTransitionInterface {
  late final Pointer<Void> _ptr;

  InitializedTransition._(this._ptr) {
    _InitializedTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory InitializedTransition.lift(Pointer<Void> ptr) {
    return InitializedTransition._(ptr);
  }

  static Pointer<Void> lower(InitializedTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_initializedtransition(_ptr, status),
    );
  }

  static int allocationSize(InitializedTransition value) {
    return 8;
  }

  static LiftRetVal<InitializedTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(InitializedTransition.lift(pointer), 8);
  }

  static int write(InitializedTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _InitializedTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_initializedtransition(_ptr, status),
    );
  }

  InitializedTransitionOutcome save({
    required JsonReceiverSessionPersister persister,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initializedtransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      FfiConverterInitializedTransitionOutcome.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<InitializedTransitionOutcome> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_initializedtransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_rust_buffer,
      ffi_payjoin_ffi_rust_future_complete_rust_buffer,
      ffi_payjoin_ffi_rust_future_free_rust_buffer,
      FfiConverterInitializedTransitionOutcome.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class InputPairInterface {
  OutPoint outpoint();
}

final _InputPairFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_inputpair(ptr, status));
});

class InputPair implements InputPairInterface {
  late final Pointer<Void> _ptr;

  InputPair._(this._ptr) {
    _InputPairFinalizer.attach(this, _ptr, detach: this);
  }

  InputPair({
    required TxIn txin,
    required PsbtInput psbtin,
    required Weight? expectedWeight,
  }) : _ptr = rustCall(
         (status) => uniffi_payjoin_ffi_fn_constructor_inputpair_new(
           FfiConverterTxIn.lower(txin),
           FfiConverterPsbtInput.lower(psbtin),
           FfiConverterOptionalWeight.lower(expectedWeight),
           status,
         ),
         inputPairExceptionErrorHandler,
       ) {
    _InputPairFinalizer.attach(this, _ptr, detach: this);
  }

  factory InputPair.lift(Pointer<Void> ptr) {
    return InputPair._(ptr);
  }

  static Pointer<Void> lower(InputPair value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_inputpair(_ptr, status),
    );
  }

  static int allocationSize(InputPair value) {
    return 8;
  }

  static LiftRetVal<InputPair> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(InputPair.lift(pointer), 8);
  }

  static int write(InputPair value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _InputPairFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_inputpair(_ptr, status));
  }

  OutPoint outpoint() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_inputpair_outpoint(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterOutPoint.lift,
      null,
    );
  }
}

abstract class IsOutputKnown {
  bool callback(OutPoint outpoint);
}

class FfiConverterCallbackInterfaceIsOutputKnown {
  static final _handleMap = UniffiHandleMap<IsOutputKnown>();
  static bool _vtableInitialized = false;

  static IsOutputKnown lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _IsOutputKnownImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(IsOutputKnown value) {
    if (value is _IsOutputKnownImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initIsOutputKnownVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<IsOutputKnown> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(IsOutputKnown value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(IsOutputKnown value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceIsOutputKnownMethod0 =
    Void Function(Uint64, RustBuffer, Pointer<Int8>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceIsOutputKnownMethod0Dart =
    void Function(int, RustBuffer, Pointer<Int8>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceIsOutputKnownFree = Void Function(Uint64);
typedef UniffiCallbackInterfaceIsOutputKnownFreeDart = void Function(int);
typedef UniffiCallbackInterfaceIsOutputKnownClone = Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceIsOutputKnownCloneDart = int Function(int);

final class _IsOutputKnownImpl implements IsOutputKnown {
  _IsOutputKnownImpl._internal(this._ptr) {
    _IsOutputKnownImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>> _IsOutputKnownImplFinalizer =
      Finalizer<Pointer<Void>>((ptr) {
        rustCall(
          (status) => uniffi_payjoin_ffi_fn_free_isoutputknown(ptr, status),
        );
      });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_isoutputknown(_ptr, status),
    );
  }

  void dispose() {
    _IsOutputKnownImplFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_isoutputknown(_ptr, status),
    );
  }

  @override
  bool callback(OutPoint outpoint) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_isoutputknown_callback(
        uniffiClonePointer(),
        FfiConverterOutPoint.lower(outpoint),
        status,
      ),
      FfiConverterBool.lift,
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceIsOutputKnown extends Struct {
  external Pointer<NativeFunction<UniffiCallbackInterfaceIsOutputKnownFree>>
  uniffiFree;
  external Pointer<NativeFunction<UniffiCallbackInterfaceIsOutputKnownClone>>
  uniffiClone;
  external Pointer<NativeFunction<UniffiCallbackInterfaceIsOutputKnownMethod0>>
  callback;
}

void isOutputKnownCallback(
  int uniffiHandle,
  RustBuffer outpoint,
  Pointer<Int8> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceIsOutputKnown._handleMap.get(
      uniffiHandle,
    );
    final arg0 = FfiConverterOutPoint.lift(outpoint);
    final result = obj.callback(arg0);
    outReturn.value = result ? 1 : 0;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceIsOutputKnownMethod0>>
isOutputKnownCallbackPointer =
    Pointer.fromFunction<UniffiCallbackInterfaceIsOutputKnownMethod0>(
      isOutputKnownCallback,
    );

void isOutputKnownFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceIsOutputKnown._handleMap.remove(handle);
  } catch (e) {}
}

final Pointer<NativeFunction<UniffiCallbackInterfaceIsOutputKnownFree>>
isOutputKnownFreePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceIsOutputKnownFree>(
      isOutputKnownFreeCallback,
    );

int isOutputKnownCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceIsOutputKnown._handleMap.get(
      handle,
    );
    final newHandle = FfiConverterCallbackInterfaceIsOutputKnown._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceIsOutputKnownClone>>
isOutputKnownClonePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceIsOutputKnownClone>(
      isOutputKnownCloneCallback,
      0,
    );
late final Pointer<UniffiVTableCallbackInterfaceIsOutputKnown>
isOutputKnownVTable;

void initIsOutputKnownVTable() {
  if (FfiConverterCallbackInterfaceIsOutputKnown._vtableInitialized) {
    return;
  }

  isOutputKnownVTable = calloc<UniffiVTableCallbackInterfaceIsOutputKnown>();
  isOutputKnownVTable.ref.uniffiFree = isOutputKnownFreePointer;
  isOutputKnownVTable.ref.uniffiClone = isOutputKnownClonePointer;
  isOutputKnownVTable.ref.callback = isOutputKnownCallbackPointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_isoutputknown(
      isOutputKnownVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceIsOutputKnown._vtableInitialized = true;
}

abstract class IsScriptOwned {
  bool callback(Uint8List script);
}

class FfiConverterCallbackInterfaceIsScriptOwned {
  static final _handleMap = UniffiHandleMap<IsScriptOwned>();
  static bool _vtableInitialized = false;

  static IsScriptOwned lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _IsScriptOwnedImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(IsScriptOwned value) {
    if (value is _IsScriptOwnedImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initIsScriptOwnedVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<IsScriptOwned> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(IsScriptOwned value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(IsScriptOwned value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceIsScriptOwnedMethod0 =
    Void Function(Uint64, RustBuffer, Pointer<Int8>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceIsScriptOwnedMethod0Dart =
    void Function(int, RustBuffer, Pointer<Int8>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceIsScriptOwnedFree = Void Function(Uint64);
typedef UniffiCallbackInterfaceIsScriptOwnedFreeDart = void Function(int);
typedef UniffiCallbackInterfaceIsScriptOwnedClone = Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceIsScriptOwnedCloneDart = int Function(int);

final class _IsScriptOwnedImpl implements IsScriptOwned {
  _IsScriptOwnedImpl._internal(this._ptr) {
    _IsScriptOwnedImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>> _IsScriptOwnedImplFinalizer =
      Finalizer<Pointer<Void>>((ptr) {
        rustCall(
          (status) => uniffi_payjoin_ffi_fn_free_isscriptowned(ptr, status),
        );
      });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_isscriptowned(_ptr, status),
    );
  }

  void dispose() {
    _IsScriptOwnedImplFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_isscriptowned(_ptr, status),
    );
  }

  @override
  bool callback(Uint8List script) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_isscriptowned_callback(
        uniffiClonePointer(),
        FfiConverterUint8List.lower(script),
        status,
      ),
      FfiConverterBool.lift,
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceIsScriptOwned extends Struct {
  external Pointer<NativeFunction<UniffiCallbackInterfaceIsScriptOwnedFree>>
  uniffiFree;
  external Pointer<NativeFunction<UniffiCallbackInterfaceIsScriptOwnedClone>>
  uniffiClone;
  external Pointer<NativeFunction<UniffiCallbackInterfaceIsScriptOwnedMethod0>>
  callback;
}

void isScriptOwnedCallback(
  int uniffiHandle,
  RustBuffer script,
  Pointer<Int8> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceIsScriptOwned._handleMap.get(
      uniffiHandle,
    );
    final arg0 = FfiConverterUint8List.lift(script);
    final result = obj.callback(arg0);
    outReturn.value = result ? 1 : 0;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceIsScriptOwnedMethod0>>
isScriptOwnedCallbackPointer =
    Pointer.fromFunction<UniffiCallbackInterfaceIsScriptOwnedMethod0>(
      isScriptOwnedCallback,
    );

void isScriptOwnedFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceIsScriptOwned._handleMap.remove(handle);
  } catch (e) {}
}

final Pointer<NativeFunction<UniffiCallbackInterfaceIsScriptOwnedFree>>
isScriptOwnedFreePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceIsScriptOwnedFree>(
      isScriptOwnedFreeCallback,
    );

int isScriptOwnedCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceIsScriptOwned._handleMap.get(
      handle,
    );
    final newHandle = FfiConverterCallbackInterfaceIsScriptOwned._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceIsScriptOwnedClone>>
isScriptOwnedClonePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceIsScriptOwnedClone>(
      isScriptOwnedCloneCallback,
      0,
    );
late final Pointer<UniffiVTableCallbackInterfaceIsScriptOwned>
isScriptOwnedVTable;

void initIsScriptOwnedVTable() {
  if (FfiConverterCallbackInterfaceIsScriptOwned._vtableInitialized) {
    return;
  }

  isScriptOwnedVTable = calloc<UniffiVTableCallbackInterfaceIsScriptOwned>();
  isScriptOwnedVTable.ref.uniffiFree = isScriptOwnedFreePointer;
  isScriptOwnedVTable.ref.uniffiClone = isScriptOwnedClonePointer;
  isScriptOwnedVTable.ref.callback = isScriptOwnedCallbackPointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_isscriptowned(
      isScriptOwnedVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceIsScriptOwned._vtableInitialized = true;
}

abstract class JsonReceiverSessionPersister {
  void save(String event);
  List<String> load();
  void close();
}

class FfiConverterCallbackInterfaceJsonReceiverSessionPersister {
  static final _handleMap = UniffiHandleMap<JsonReceiverSessionPersister>();
  static bool _vtableInitialized = false;

  static JsonReceiverSessionPersister lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _JsonReceiverSessionPersisterImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(JsonReceiverSessionPersister value) {
    if (value is _JsonReceiverSessionPersisterImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initJsonReceiverSessionPersisterVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<JsonReceiverSessionPersister> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(JsonReceiverSessionPersister value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(JsonReceiverSessionPersister value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod0 =
    Void Function(Uint64, RustBuffer, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod0Dart =
    void Function(int, RustBuffer, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod1 =
    Void Function(Uint64, Pointer<RustBuffer>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod1Dart =
    void Function(int, Pointer<RustBuffer>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod2 =
    Void Function(Uint64, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod2Dart =
    void Function(int, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterFree =
    Void Function(Uint64);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterFreeDart =
    void Function(int);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterClone =
    Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterCloneDart =
    int Function(int);

final class _JsonReceiverSessionPersisterImpl
    implements JsonReceiverSessionPersister {
  _JsonReceiverSessionPersisterImpl._internal(this._ptr) {
    _JsonReceiverSessionPersisterImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>>
  _JsonReceiverSessionPersisterImplFinalizer = Finalizer<Pointer<Void>>((ptr) {
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_jsonreceiversessionpersister(ptr, status),
    );
  });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_jsonreceiversessionpersister(
        _ptr,
        status,
      ),
    );
  }

  void dispose() {
    _JsonReceiverSessionPersisterImplFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_jsonreceiversessionpersister(_ptr, status),
    );
  }

  @override
  void save(String event) {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersister_save(
        uniffiClonePointer(),
        FfiConverterString.lower(event),
        status,
      );
    }, foreignExceptionErrorHandler);
  }

  @override
  List<String> load() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersister_load(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterSequenceString.lift,
      foreignExceptionErrorHandler,
    );
  }

  @override
  void close() {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersister_close(
        uniffiClonePointer(),
        status,
      );
    }, foreignExceptionErrorHandler);
  }
}

final class UniffiVTableCallbackInterfaceJsonReceiverSessionPersister
    extends Struct {
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterFree>
  >
  uniffiFree;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterClone>
  >
  uniffiClone;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod0>
  >
  save;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod1>
  >
  load;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod2>
  >
  close;
}

void jsonReceiverSessionPersisterSave(
  int uniffiHandle,
  RustBuffer event,
  Pointer<Void> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersister
        ._handleMap
        .get(uniffiHandle);
    final arg0 = FfiConverterString.lift(event);
    obj.save(arg0);
    status.code = CALL_SUCCESS;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod0>
>
jsonReceiverSessionPersisterSavePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod0
    >(jsonReceiverSessionPersisterSave);
void jsonReceiverSessionPersisterLoad(
  int uniffiHandle,
  Pointer<RustBuffer> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersister
        ._handleMap
        .get(uniffiHandle);
    final result = obj.load();
    outReturn.ref = FfiConverterSequenceString.lower(result);
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod1>
>
jsonReceiverSessionPersisterLoadPointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod1
    >(jsonReceiverSessionPersisterLoad);
void jsonReceiverSessionPersisterClose(
  int uniffiHandle,
  Pointer<Void> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersister
        ._handleMap
        .get(uniffiHandle);
    obj.close();
    status.code = CALL_SUCCESS;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod2>
>
jsonReceiverSessionPersisterClosePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterMethod2
    >(jsonReceiverSessionPersisterClose);

void jsonReceiverSessionPersisterFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceJsonReceiverSessionPersister._handleMap.remove(
      handle,
    );
  } catch (e) {}
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterFree>
>
jsonReceiverSessionPersisterFreePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterFree
    >(jsonReceiverSessionPersisterFreeCallback);

int jsonReceiverSessionPersisterCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersister
        ._handleMap
        .get(handle);
    final newHandle = FfiConverterCallbackInterfaceJsonReceiverSessionPersister
        ._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterClone>
>
jsonReceiverSessionPersisterClonePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterClone
    >(jsonReceiverSessionPersisterCloneCallback, 0);
late final Pointer<UniffiVTableCallbackInterfaceJsonReceiverSessionPersister>
jsonReceiverSessionPersisterVTable;

void initJsonReceiverSessionPersisterVTable() {
  if (FfiConverterCallbackInterfaceJsonReceiverSessionPersister
      ._vtableInitialized) {
    return;
  }

  jsonReceiverSessionPersisterVTable =
      calloc<UniffiVTableCallbackInterfaceJsonReceiverSessionPersister>();
  jsonReceiverSessionPersisterVTable.ref.uniffiFree =
      jsonReceiverSessionPersisterFreePointer;
  jsonReceiverSessionPersisterVTable.ref.uniffiClone =
      jsonReceiverSessionPersisterClonePointer;
  jsonReceiverSessionPersisterVTable.ref.save =
      jsonReceiverSessionPersisterSavePointer;
  jsonReceiverSessionPersisterVTable.ref.load =
      jsonReceiverSessionPersisterLoadPointer;
  jsonReceiverSessionPersisterVTable.ref.close =
      jsonReceiverSessionPersisterClosePointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_jsonreceiversessionpersister(
      jsonReceiverSessionPersisterVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceJsonReceiverSessionPersister._vtableInitialized =
      true;
}

abstract class JsonReceiverSessionPersisterAsync {
  Future<void> save(String event);
  Future<List<String>> load();
  Future<void> close();
}

class FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync {
  static final _handleMap =
      UniffiHandleMap<JsonReceiverSessionPersisterAsync>();
  static bool _vtableInitialized = false;

  static JsonReceiverSessionPersisterAsync lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _JsonReceiverSessionPersisterAsyncImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(JsonReceiverSessionPersisterAsync value) {
    if (value is _JsonReceiverSessionPersisterAsyncImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initJsonReceiverSessionPersisterAsyncVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<JsonReceiverSessionPersisterAsync> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(JsonReceiverSessionPersisterAsync value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(JsonReceiverSessionPersisterAsync value) {
    return 8;
  }
}

typedef UniffiForeignFutureCompleteVoid =
    Void Function(Uint64, UniffiForeignFutureResultVoid);
typedef UniffiForeignFutureCompleteVoidDart =
    void Function(int, UniffiForeignFutureResultVoid);
typedef UniffiForeignFutureCompleteRustBuffer =
    Void Function(Uint64, UniffiForeignFutureResultRustBuffer);
typedef UniffiForeignFutureCompleteRustBufferDart =
    void Function(int, UniffiForeignFutureResultRustBuffer);

final class UniffiForeignFutureResultVoid extends Struct {
  external RustCallStatus callStatus;
}

final class UniffiForeignFutureResultRustBuffer extends Struct {
  external RustBuffer returnValue;
  external RustCallStatus callStatus;
}

typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod0 =
    Void Function(
      Uint64,
      RustBuffer,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      Uint64,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod0Dart =
    void Function(
      int,
      RustBuffer,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      int,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod1 =
    Void Function(
      Uint64,
      Pointer<NativeFunction<UniffiForeignFutureCompleteRustBuffer>>,
      Uint64,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod1Dart =
    void Function(
      int,
      Pointer<NativeFunction<UniffiForeignFutureCompleteRustBuffer>>,
      int,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod2 =
    Void Function(
      Uint64,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      Uint64,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod2Dart =
    void Function(
      int,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      int,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncFree =
    Void Function(Uint64);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncFreeDart =
    void Function(int);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncClone =
    Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncCloneDart =
    int Function(int);

final class _JsonReceiverSessionPersisterAsyncImpl
    implements JsonReceiverSessionPersisterAsync {
  _JsonReceiverSessionPersisterAsyncImpl._internal(this._ptr) {
    _JsonReceiverSessionPersisterAsyncImplFinalizer.attach(
      this,
      _ptr,
      detach: this,
    );
  }

  static final Finalizer<Pointer<Void>>
  _JsonReceiverSessionPersisterAsyncImplFinalizer = Finalizer<Pointer<Void>>((
    ptr,
  ) {
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_jsonreceiversessionpersisterasync(
        ptr,
        status,
      ),
    );
  });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_jsonreceiversessionpersisterasync(
        _ptr,
        status,
      ),
    );
  }

  void dispose() {
    _JsonReceiverSessionPersisterAsyncImplFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_jsonreceiversessionpersisterasync(
        _ptr,
        status,
      ),
    );
  }

  @override
  Future<void> save(String event) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersisterasync_save(
        uniffiClonePointer(),
        FfiConverterString.lower(event),
      ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      foreignExceptionErrorHandler,
    );
  }

  @override
  Future<List<String>> load() {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersisterasync_load(
        uniffiClonePointer(),
      ),
      ffi_payjoin_ffi_rust_future_poll_rust_buffer,
      ffi_payjoin_ffi_rust_future_complete_rust_buffer,
      ffi_payjoin_ffi_rust_future_free_rust_buffer,
      FfiConverterSequenceString.lift,
      foreignExceptionErrorHandler,
    );
  }

  @override
  Future<void> close() {
    return uniffiRustCallAsync(
      () =>
          uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersisterasync_close(
            uniffiClonePointer(),
          ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceJsonReceiverSessionPersisterAsync
    extends Struct {
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncFree>
  >
  uniffiFree;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncClone
    >
  >
  uniffiClone;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod0
    >
  >
  save;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod1
    >
  >
  load;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod2
    >
  >
  close;
}

void jsonReceiverSessionPersisterAsyncSave(
  int uniffiHandle,
  RustBuffer event,
  Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>> uniffiFutureCallback,
  int uniffiCallbackData,
  Pointer<UniffiForeignFuture> outReturn,
) {
  final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
      ._handleMap
      .get(uniffiHandle);
  final arg0 = FfiConverterString.lift(event);
  final callback = uniffiFutureCallback
      .asFunction<UniffiForeignFutureCompleteVoidDart>();
  final state = _UniffiForeignFutureState();
  final handle = _uniffiForeignFutureHandleMap.insert(state);
  outReturn.ref.handle = handle;
  outReturn.ref.free = _uniffiForeignFutureFreePointer;

  () async {
    try {
      final result = await obj.save(arg0);
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        resultStructPtr.ref.callStatus.code = CALL_SUCCESS;
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    } catch (e) {
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        if (e is ForeignException) {
          resultStructPtr.ref.callStatus.code = CALL_ERROR;
          resultStructPtr.ref.callStatus.errorBuf =
              FfiConverterForeignException.lower(e);
        } else {
          resultStructPtr.ref.callStatus.code = CALL_UNEXPECTED_ERROR;
          resultStructPtr.ref.callStatus.errorBuf = FfiConverterString.lower(
            e.toString(),
          );
        }
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    }
  }();
}

final Pointer<
  NativeFunction<
    UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod0
  >
>
jsonReceiverSessionPersisterAsyncSavePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod0
    >(jsonReceiverSessionPersisterAsyncSave);
void jsonReceiverSessionPersisterAsyncLoad(
  int uniffiHandle,
  Pointer<NativeFunction<UniffiForeignFutureCompleteRustBuffer>>
  uniffiFutureCallback,
  int uniffiCallbackData,
  Pointer<UniffiForeignFuture> outReturn,
) {
  final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
      ._handleMap
      .get(uniffiHandle);
  final callback = uniffiFutureCallback
      .asFunction<UniffiForeignFutureCompleteRustBufferDart>();
  final state = _UniffiForeignFutureState();
  final handle = _uniffiForeignFutureHandleMap.insert(state);
  outReturn.ref.handle = handle;
  outReturn.ref.free = _uniffiForeignFutureFreePointer;

  () async {
    try {
      final result = await obj.load();
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultRustBuffer>();
      try {
        resultStructPtr.ref.returnValue = FfiConverterSequenceString.lower(
          result,
        );
        resultStructPtr.ref.callStatus.code = CALL_SUCCESS;
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    } catch (e) {
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultRustBuffer>();
      try {
        if (e is ForeignException) {
          resultStructPtr.ref.callStatus.code = CALL_ERROR;
          resultStructPtr.ref.callStatus.errorBuf =
              FfiConverterForeignException.lower(e);
        } else {
          resultStructPtr.ref.callStatus.code = CALL_UNEXPECTED_ERROR;
          resultStructPtr.ref.callStatus.errorBuf = FfiConverterString.lower(
            e.toString(),
          );
        }
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    }
  }();
}

final Pointer<
  NativeFunction<
    UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod1
  >
>
jsonReceiverSessionPersisterAsyncLoadPointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod1
    >(jsonReceiverSessionPersisterAsyncLoad);
void jsonReceiverSessionPersisterAsyncClose(
  int uniffiHandle,
  Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>> uniffiFutureCallback,
  int uniffiCallbackData,
  Pointer<UniffiForeignFuture> outReturn,
) {
  final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
      ._handleMap
      .get(uniffiHandle);
  final callback = uniffiFutureCallback
      .asFunction<UniffiForeignFutureCompleteVoidDart>();
  final state = _UniffiForeignFutureState();
  final handle = _uniffiForeignFutureHandleMap.insert(state);
  outReturn.ref.handle = handle;
  outReturn.ref.free = _uniffiForeignFutureFreePointer;

  () async {
    try {
      final result = await obj.close();
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        resultStructPtr.ref.callStatus.code = CALL_SUCCESS;
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    } catch (e) {
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        if (e is ForeignException) {
          resultStructPtr.ref.callStatus.code = CALL_ERROR;
          resultStructPtr.ref.callStatus.errorBuf =
              FfiConverterForeignException.lower(e);
        } else {
          resultStructPtr.ref.callStatus.code = CALL_UNEXPECTED_ERROR;
          resultStructPtr.ref.callStatus.errorBuf = FfiConverterString.lower(
            e.toString(),
          );
        }
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    }
  }();
}

final Pointer<
  NativeFunction<
    UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod2
  >
>
jsonReceiverSessionPersisterAsyncClosePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncMethod2
    >(jsonReceiverSessionPersisterAsyncClose);

void jsonReceiverSessionPersisterAsyncFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync._handleMap
        .remove(handle);
  } catch (e) {}
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncFree>
>
jsonReceiverSessionPersisterAsyncFreePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncFree
    >(jsonReceiverSessionPersisterAsyncFreeCallback);

int jsonReceiverSessionPersisterAsyncCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
        ._handleMap
        .get(handle);
    final newHandle =
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
            ._handleMap
            .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncClone>
>
jsonReceiverSessionPersisterAsyncClonePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonReceiverSessionPersisterAsyncClone
    >(jsonReceiverSessionPersisterAsyncCloneCallback, 0);
late final Pointer<
  UniffiVTableCallbackInterfaceJsonReceiverSessionPersisterAsync
>
jsonReceiverSessionPersisterAsyncVTable;

void initJsonReceiverSessionPersisterAsyncVTable() {
  if (FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
      ._vtableInitialized) {
    return;
  }

  jsonReceiverSessionPersisterAsyncVTable =
      calloc<UniffiVTableCallbackInterfaceJsonReceiverSessionPersisterAsync>();
  jsonReceiverSessionPersisterAsyncVTable.ref.uniffiFree =
      jsonReceiverSessionPersisterAsyncFreePointer;
  jsonReceiverSessionPersisterAsyncVTable.ref.uniffiClone =
      jsonReceiverSessionPersisterAsyncClonePointer;
  jsonReceiverSessionPersisterAsyncVTable.ref.save =
      jsonReceiverSessionPersisterAsyncSavePointer;
  jsonReceiverSessionPersisterAsyncVTable.ref.load =
      jsonReceiverSessionPersisterAsyncLoadPointer;
  jsonReceiverSessionPersisterAsyncVTable.ref.close =
      jsonReceiverSessionPersisterAsyncClosePointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_jsonreceiversessionpersisterasync(
      jsonReceiverSessionPersisterAsyncVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync
          ._vtableInitialized =
      true;
}

abstract class MaybeInputsOwnedInterface {
  CancelTransition cancel();
  MaybeInputsOwnedTransition checkInputsNotOwned({
    required IsScriptOwned isOwned,
  });
  Uint8List extractTxToScheduleBroadcast();
}

final _MaybeInputsOwnedFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_maybeinputsowned(ptr, status),
  );
});

class MaybeInputsOwned implements MaybeInputsOwnedInterface {
  late final Pointer<Void> _ptr;

  MaybeInputsOwned._(this._ptr) {
    _MaybeInputsOwnedFinalizer.attach(this, _ptr, detach: this);
  }

  factory MaybeInputsOwned.lift(Pointer<Void> ptr) {
    return MaybeInputsOwned._(ptr);
  }

  static Pointer<Void> lower(MaybeInputsOwned value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_maybeinputsowned(_ptr, status),
    );
  }

  static int allocationSize(MaybeInputsOwned value) {
    return 8;
  }

  static LiftRetVal<MaybeInputsOwned> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(MaybeInputsOwned.lift(pointer), 8);
  }

  static int write(MaybeInputsOwned value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _MaybeInputsOwnedFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_maybeinputsowned(_ptr, status),
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_maybeinputsowned_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  MaybeInputsOwnedTransition checkInputsNotOwned({
    required IsScriptOwned isOwned,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_maybeinputsowned_check_inputs_not_owned(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceIsScriptOwned.lower(isOwned),
            status,
          ),
      MaybeInputsOwnedTransition.lift,
      null,
    );
  }

  Uint8List extractTxToScheduleBroadcast() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_maybeinputsowned_extract_tx_to_schedule_broadcast(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterUint8List.lift,
      null,
    );
  }
}

abstract class MaybeInputsOwnedTransitionInterface {
  MaybeInputsSeen save({required JsonReceiverSessionPersister persister});
  Future<MaybeInputsSeen> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _MaybeInputsOwnedTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_maybeinputsownedtransition(ptr, status),
  );
});

class MaybeInputsOwnedTransition
    implements MaybeInputsOwnedTransitionInterface {
  late final Pointer<Void> _ptr;

  MaybeInputsOwnedTransition._(this._ptr) {
    _MaybeInputsOwnedTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory MaybeInputsOwnedTransition.lift(Pointer<Void> ptr) {
    return MaybeInputsOwnedTransition._(ptr);
  }

  static Pointer<Void> lower(MaybeInputsOwnedTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_maybeinputsownedtransition(_ptr, status),
    );
  }

  static int allocationSize(MaybeInputsOwnedTransition value) {
    return 8;
  }

  static LiftRetVal<MaybeInputsOwnedTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(MaybeInputsOwnedTransition.lift(pointer), 8);
  }

  static int write(MaybeInputsOwnedTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _MaybeInputsOwnedTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_maybeinputsownedtransition(_ptr, status),
    );
  }

  MaybeInputsSeen save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_maybeinputsownedtransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      MaybeInputsSeen.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<MaybeInputsSeen> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_maybeinputsownedtransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => MaybeInputsSeen.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class MaybeInputsSeenInterface {
  CancelTransition cancel();
  MaybeInputsSeenTransition checkNoInputsSeenBefore({
    required IsOutputKnown isKnown,
  });
}

final _MaybeInputsSeenFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_maybeinputsseen(ptr, status));
});

class MaybeInputsSeen implements MaybeInputsSeenInterface {
  late final Pointer<Void> _ptr;

  MaybeInputsSeen._(this._ptr) {
    _MaybeInputsSeenFinalizer.attach(this, _ptr, detach: this);
  }

  factory MaybeInputsSeen.lift(Pointer<Void> ptr) {
    return MaybeInputsSeen._(ptr);
  }

  static Pointer<Void> lower(MaybeInputsSeen value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_maybeinputsseen(_ptr, status),
    );
  }

  static int allocationSize(MaybeInputsSeen value) {
    return 8;
  }

  static LiftRetVal<MaybeInputsSeen> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(MaybeInputsSeen.lift(pointer), 8);
  }

  static int write(MaybeInputsSeen value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _MaybeInputsSeenFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_maybeinputsseen(_ptr, status),
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_maybeinputsseen_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  MaybeInputsSeenTransition checkNoInputsSeenBefore({
    required IsOutputKnown isKnown,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_maybeinputsseen_check_no_inputs_seen_before(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceIsOutputKnown.lower(isKnown),
            status,
          ),
      MaybeInputsSeenTransition.lift,
      null,
    );
  }
}

abstract class MaybeInputsSeenTransitionInterface {
  OutputsUnknown save({required JsonReceiverSessionPersister persister});
  Future<OutputsUnknown> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _MaybeInputsSeenTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_maybeinputsseentransition(ptr, status),
  );
});

class MaybeInputsSeenTransition implements MaybeInputsSeenTransitionInterface {
  late final Pointer<Void> _ptr;

  MaybeInputsSeenTransition._(this._ptr) {
    _MaybeInputsSeenTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory MaybeInputsSeenTransition.lift(Pointer<Void> ptr) {
    return MaybeInputsSeenTransition._(ptr);
  }

  static Pointer<Void> lower(MaybeInputsSeenTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_maybeinputsseentransition(_ptr, status),
    );
  }

  static int allocationSize(MaybeInputsSeenTransition value) {
    return 8;
  }

  static LiftRetVal<MaybeInputsSeenTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(MaybeInputsSeenTransition.lift(pointer), 8);
  }

  static int write(MaybeInputsSeenTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _MaybeInputsSeenTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_maybeinputsseentransition(_ptr, status),
    );
  }

  OutputsUnknown save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_maybeinputsseentransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      OutputsUnknown.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<OutputsUnknown> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_maybeinputsseentransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => OutputsUnknown.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class MonitorInterface {
  CancelTransition cancel();
  MonitorTransition checkForTransaction({
    required TransactionFinder findTransaction,
  });
}

final _MonitorFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_monitor(ptr, status));
});

class Monitor implements MonitorInterface {
  late final Pointer<Void> _ptr;

  Monitor._(this._ptr) {
    _MonitorFinalizer.attach(this, _ptr, detach: this);
  }

  factory Monitor.lift(Pointer<Void> ptr) {
    return Monitor._(ptr);
  }

  static Pointer<Void> lower(Monitor value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_monitor(_ptr, status),
    );
  }

  static int allocationSize(Monitor value) {
    return 8;
  }

  static LiftRetVal<Monitor> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(Monitor.lift(pointer), 8);
  }

  static int write(Monitor value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _MonitorFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_monitor(_ptr, status));
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_monitor_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  MonitorTransition checkForTransaction({
    required TransactionFinder findTransaction,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_monitor_check_for_transaction(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceTransactionFinder.lower(findTransaction),
        status,
      ),
      MonitorTransition.lift,
      null,
    );
  }
}

abstract class MonitorTransitionInterface {
  void save({required JsonReceiverSessionPersister persister});
  Future<void> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _MonitorTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_monitortransition(ptr, status),
  );
});

class MonitorTransition implements MonitorTransitionInterface {
  late final Pointer<Void> _ptr;

  MonitorTransition._(this._ptr) {
    _MonitorTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory MonitorTransition.lift(Pointer<Void> ptr) {
    return MonitorTransition._(ptr);
  }

  static Pointer<Void> lower(MonitorTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_monitortransition(_ptr, status),
    );
  }

  static int allocationSize(MonitorTransition value) {
    return 8;
  }

  static LiftRetVal<MonitorTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(MonitorTransition.lift(pointer), 8);
  }

  static int write(MonitorTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _MonitorTransitionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_monitortransition(_ptr, status),
    );
  }

  void save({required JsonReceiverSessionPersister persister}) {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_monitortransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      );
    }, receiverPersistedExceptionErrorHandler);
  }

  Future<void> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_monitortransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class OutputsUnknownInterface {
  CancelTransition cancel();
  OutputsUnknownTransition identifyReceiverOutputs({
    required IsScriptOwned isReceiverOutput,
  });
}

final _OutputsUnknownFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_outputsunknown(ptr, status));
});

class OutputsUnknown implements OutputsUnknownInterface {
  late final Pointer<Void> _ptr;

  OutputsUnknown._(this._ptr) {
    _OutputsUnknownFinalizer.attach(this, _ptr, detach: this);
  }

  factory OutputsUnknown.lift(Pointer<Void> ptr) {
    return OutputsUnknown._(ptr);
  }

  static Pointer<Void> lower(OutputsUnknown value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_outputsunknown(_ptr, status),
    );
  }

  static int allocationSize(OutputsUnknown value) {
    return 8;
  }

  static LiftRetVal<OutputsUnknown> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(OutputsUnknown.lift(pointer), 8);
  }

  static int write(OutputsUnknown value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _OutputsUnknownFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_outputsunknown(_ptr, status),
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_outputsunknown_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  OutputsUnknownTransition identifyReceiverOutputs({
    required IsScriptOwned isReceiverOutput,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_outputsunknown_identify_receiver_outputs(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceIsScriptOwned.lower(isReceiverOutput),
            status,
          ),
      OutputsUnknownTransition.lift,
      null,
    );
  }
}

abstract class OutputsUnknownTransitionInterface {
  WantsOutputs save({required JsonReceiverSessionPersister persister});
  Future<WantsOutputs> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _OutputsUnknownTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_outputsunknowntransition(ptr, status),
  );
});

class OutputsUnknownTransition implements OutputsUnknownTransitionInterface {
  late final Pointer<Void> _ptr;

  OutputsUnknownTransition._(this._ptr) {
    _OutputsUnknownTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory OutputsUnknownTransition.lift(Pointer<Void> ptr) {
    return OutputsUnknownTransition._(ptr);
  }

  static Pointer<Void> lower(OutputsUnknownTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_outputsunknowntransition(_ptr, status),
    );
  }

  static int allocationSize(OutputsUnknownTransition value) {
    return 8;
  }

  static LiftRetVal<OutputsUnknownTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(OutputsUnknownTransition.lift(pointer), 8);
  }

  static int write(OutputsUnknownTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _OutputsUnknownTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_outputsunknowntransition(_ptr, status),
    );
  }

  WantsOutputs save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_outputsunknowntransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      WantsOutputs.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<WantsOutputs> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_outputsunknowntransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => WantsOutputs.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class PayjoinProposalInterface {
  CancelTransition cancel();
  RequestResponse createPostRequest({required String ohttpRelay});
  PayjoinProposalTransition processResponse({
    required Uint8List body,
    required ClientResponse ohttpContext,
  });
  String psbt();
}

final _PayjoinProposalFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_payjoinproposal(ptr, status));
});

class PayjoinProposal implements PayjoinProposalInterface {
  late final Pointer<Void> _ptr;

  PayjoinProposal._(this._ptr) {
    _PayjoinProposalFinalizer.attach(this, _ptr, detach: this);
  }

  factory PayjoinProposal.lift(Pointer<Void> ptr) {
    return PayjoinProposal._(ptr);
  }

  static Pointer<Void> lower(PayjoinProposal value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_payjoinproposal(_ptr, status),
    );
  }

  static int allocationSize(PayjoinProposal value) {
    return 8;
  }

  static LiftRetVal<PayjoinProposal> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PayjoinProposal.lift(pointer), 8);
  }

  static int write(PayjoinProposal value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PayjoinProposalFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_payjoinproposal(_ptr, status),
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_payjoinproposal_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  RequestResponse createPostRequest({required String ohttpRelay}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_payjoinproposal_create_post_request(
            uniffiClonePointer(),
            FfiConverterString.lower(ohttpRelay),
            status,
          ),
      FfiConverterRequestResponse.lift,
      receiverCreateRequestExceptionErrorHandler,
    );
  }

  PayjoinProposalTransition processResponse({
    required Uint8List body,
    required ClientResponse ohttpContext,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_payjoinproposal_process_response(
        uniffiClonePointer(),
        FfiConverterUint8List.lower(body),
        ClientResponse.lower(ohttpContext),
        status,
      ),
      PayjoinProposalTransition.lift,
      null,
    );
  }

  String psbt() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_payjoinproposal_psbt(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class PayjoinProposalTransitionInterface {
  Monitor save({required JsonReceiverSessionPersister persister});
  Future<Monitor> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _PayjoinProposalTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_payjoinproposaltransition(ptr, status),
  );
});

class PayjoinProposalTransition implements PayjoinProposalTransitionInterface {
  late final Pointer<Void> _ptr;

  PayjoinProposalTransition._(this._ptr) {
    _PayjoinProposalTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory PayjoinProposalTransition.lift(Pointer<Void> ptr) {
    return PayjoinProposalTransition._(ptr);
  }

  static Pointer<Void> lower(PayjoinProposalTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_payjoinproposaltransition(_ptr, status),
    );
  }

  static int allocationSize(PayjoinProposalTransition value) {
    return 8;
  }

  static LiftRetVal<PayjoinProposalTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PayjoinProposalTransition.lift(pointer), 8);
  }

  static int write(PayjoinProposalTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PayjoinProposalTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_payjoinproposaltransition(_ptr, status),
    );
  }

  Monitor save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_payjoinproposaltransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      Monitor.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<Monitor> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_payjoinproposaltransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => Monitor.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class PendingFallbackTransitionInterface {
  void save({required JsonReceiverSessionPersister persister});
  Future<void> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _PendingFallbackTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_pendingfallbacktransition(ptr, status),
  );
});

class PendingFallbackTransition implements PendingFallbackTransitionInterface {
  late final Pointer<Void> _ptr;

  PendingFallbackTransition._(this._ptr) {
    _PendingFallbackTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory PendingFallbackTransition.lift(Pointer<Void> ptr) {
    return PendingFallbackTransition._(ptr);
  }

  static Pointer<Void> lower(PendingFallbackTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_pendingfallbacktransition(_ptr, status),
    );
  }

  static int allocationSize(PendingFallbackTransition value) {
    return 8;
  }

  static LiftRetVal<PendingFallbackTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PendingFallbackTransition.lift(pointer), 8);
  }

  static int write(PendingFallbackTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PendingFallbackTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_pendingfallbacktransition(_ptr, status),
    );
  }

  void save({required JsonReceiverSessionPersister persister}) {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_pendingfallbacktransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      );
    }, receiverPersistedExceptionErrorHandler);
  }

  Future<void> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_pendingfallbacktransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class ProcessPsbt {
  String callback(String psbt);
}

class FfiConverterCallbackInterfaceProcessPsbt {
  static final _handleMap = UniffiHandleMap<ProcessPsbt>();
  static bool _vtableInitialized = false;

  static ProcessPsbt lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _ProcessPsbtImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(ProcessPsbt value) {
    if (value is _ProcessPsbtImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initProcessPsbtVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<ProcessPsbt> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(ProcessPsbt value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(ProcessPsbt value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceProcessPsbtMethod0 =
    Void Function(
      Uint64,
      RustBuffer,
      Pointer<RustBuffer>,
      Pointer<RustCallStatus>,
    );
typedef UniffiCallbackInterfaceProcessPsbtMethod0Dart =
    void Function(
      int,
      RustBuffer,
      Pointer<RustBuffer>,
      Pointer<RustCallStatus>,
    );
typedef UniffiCallbackInterfaceProcessPsbtFree = Void Function(Uint64);
typedef UniffiCallbackInterfaceProcessPsbtFreeDart = void Function(int);
typedef UniffiCallbackInterfaceProcessPsbtClone = Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceProcessPsbtCloneDart = int Function(int);

final class _ProcessPsbtImpl implements ProcessPsbt {
  _ProcessPsbtImpl._internal(this._ptr) {
    _ProcessPsbtImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>> _ProcessPsbtImplFinalizer =
      Finalizer<Pointer<Void>>((ptr) {
        rustCall(
          (status) => uniffi_payjoin_ffi_fn_free_processpsbt(ptr, status),
        );
      });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_processpsbt(_ptr, status),
    );
  }

  void dispose() {
    _ProcessPsbtImplFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_processpsbt(_ptr, status));
  }

  @override
  String callback(String psbt) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_processpsbt_callback(
        uniffiClonePointer(),
        FfiConverterString.lower(psbt),
        status,
      ),
      FfiConverterString.lift,
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceProcessPsbt extends Struct {
  external Pointer<NativeFunction<UniffiCallbackInterfaceProcessPsbtFree>>
  uniffiFree;
  external Pointer<NativeFunction<UniffiCallbackInterfaceProcessPsbtClone>>
  uniffiClone;
  external Pointer<NativeFunction<UniffiCallbackInterfaceProcessPsbtMethod0>>
  callback;
}

void processPsbtCallback(
  int uniffiHandle,
  RustBuffer psbt,
  Pointer<RustBuffer> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceProcessPsbt._handleMap.get(
      uniffiHandle,
    );
    final arg0 = FfiConverterString.lift(psbt);
    final result = obj.callback(arg0);
    outReturn.ref = FfiConverterString.lower(result);
    status.code = CALL_SUCCESS;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceProcessPsbtMethod0>>
processPsbtCallbackPointer =
    Pointer.fromFunction<UniffiCallbackInterfaceProcessPsbtMethod0>(
      processPsbtCallback,
    );

void processPsbtFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceProcessPsbt._handleMap.remove(handle);
  } catch (e) {}
}

final Pointer<NativeFunction<UniffiCallbackInterfaceProcessPsbtFree>>
processPsbtFreePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceProcessPsbtFree>(
      processPsbtFreeCallback,
    );

int processPsbtCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceProcessPsbt._handleMap.get(handle);
    final newHandle = FfiConverterCallbackInterfaceProcessPsbt._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceProcessPsbtClone>>
processPsbtClonePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceProcessPsbtClone>(
      processPsbtCloneCallback,
      0,
    );
late final Pointer<UniffiVTableCallbackInterfaceProcessPsbt> processPsbtVTable;

void initProcessPsbtVTable() {
  if (FfiConverterCallbackInterfaceProcessPsbt._vtableInitialized) {
    return;
  }

  processPsbtVTable = calloc<UniffiVTableCallbackInterfaceProcessPsbt>();
  processPsbtVTable.ref.uniffiFree = processPsbtFreePointer;
  processPsbtVTable.ref.uniffiClone = processPsbtClonePointer;
  processPsbtVTable.ref.callback = processPsbtCallbackPointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_processpsbt(processPsbtVTable);
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceProcessPsbt._vtableInitialized = true;
}

abstract class ProvisionalProposalInterface {
  CancelTransition cancel();
  ProvisionalProposalTransition finalizeProposal({
    required ProcessPsbt processPsbt,
  });
  String psbtToSign();
}

final _ProvisionalProposalFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_provisionalproposal(ptr, status),
  );
});

class ProvisionalProposal implements ProvisionalProposalInterface {
  late final Pointer<Void> _ptr;

  ProvisionalProposal._(this._ptr) {
    _ProvisionalProposalFinalizer.attach(this, _ptr, detach: this);
  }

  factory ProvisionalProposal.lift(Pointer<Void> ptr) {
    return ProvisionalProposal._(ptr);
  }

  static Pointer<Void> lower(ProvisionalProposal value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_provisionalproposal(_ptr, status),
    );
  }

  static int allocationSize(ProvisionalProposal value) {
    return 8;
  }

  static LiftRetVal<ProvisionalProposal> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ProvisionalProposal.lift(pointer), 8);
  }

  static int write(ProvisionalProposal value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ProvisionalProposalFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_provisionalproposal(_ptr, status),
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_provisionalproposal_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  ProvisionalProposalTransition finalizeProposal({
    required ProcessPsbt processPsbt,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_provisionalproposal_finalize_proposal(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceProcessPsbt.lower(processPsbt),
            status,
          ),
      ProvisionalProposalTransition.lift,
      null,
    );
  }

  String psbtToSign() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_provisionalproposal_psbt_to_sign(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class ProvisionalProposalTransitionInterface {
  PayjoinProposal save({required JsonReceiverSessionPersister persister});
  Future<PayjoinProposal> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _ProvisionalProposalTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_provisionalproposaltransition(ptr, status),
  );
});

class ProvisionalProposalTransition
    implements ProvisionalProposalTransitionInterface {
  late final Pointer<Void> _ptr;

  ProvisionalProposalTransition._(this._ptr) {
    _ProvisionalProposalTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory ProvisionalProposalTransition.lift(Pointer<Void> ptr) {
    return ProvisionalProposalTransition._(ptr);
  }

  static Pointer<Void> lower(ProvisionalProposalTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_provisionalproposaltransition(
        _ptr,
        status,
      ),
    );
  }

  static int allocationSize(ProvisionalProposalTransition value) {
    return 8;
  }

  static LiftRetVal<ProvisionalProposalTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ProvisionalProposalTransition.lift(pointer), 8);
  }

  static int write(ProvisionalProposalTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ProvisionalProposalTransitionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_provisionalproposaltransition(
        _ptr,
        status,
      ),
    );
  }

  PayjoinProposal save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_provisionalproposaltransition_save(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
              persister,
            ),
            status,
          ),
      PayjoinProposal.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<PayjoinProposal> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () =>
          uniffi_payjoin_ffi_fn_method_provisionalproposaltransition_save_async(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
              persister,
            ),
          ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => PayjoinProposal.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class ReceiverBuilderInterface {
  InitialReceiveTransition build();
  ReceiverBuilder withAmount({required int amountSats});
  ReceiverBuilder withExpiration({required int expirationSecs});
  ReceiverBuilder withMaxFeeRate({required int maxEffectiveFeeRateSatPerVb});
}

final _ReceiverBuilderFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_receiverbuilder(ptr, status));
});

class ReceiverBuilder implements ReceiverBuilderInterface {
  late final Pointer<Void> _ptr;

  ReceiverBuilder._(this._ptr) {
    _ReceiverBuilderFinalizer.attach(this, _ptr, detach: this);
  }

  ReceiverBuilder({
    required String address,
    required String directory,
    required OhttpKeys ohttpKeys,
  }) : _ptr = rustCall(
         (status) => uniffi_payjoin_ffi_fn_constructor_receiverbuilder_new(
           FfiConverterString.lower(address),
           FfiConverterString.lower(directory),
           OhttpKeys.lower(ohttpKeys),
           status,
         ),
         receiverBuilderExceptionErrorHandler,
       ) {
    _ReceiverBuilderFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverBuilder.lift(Pointer<Void> ptr) {
    return ReceiverBuilder._(ptr);
  }

  static Pointer<Void> lower(ReceiverBuilder value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_receiverbuilder(_ptr, status),
    );
  }

  static int allocationSize(ReceiverBuilder value) {
    return 8;
  }

  static LiftRetVal<ReceiverBuilder> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverBuilder.lift(pointer), 8);
  }

  static int write(ReceiverBuilder value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverBuilderFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_receiverbuilder(_ptr, status),
    );
  }

  InitialReceiveTransition build() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiverbuilder_build(
        uniffiClonePointer(),
        status,
      ),
      InitialReceiveTransition.lift,
      null,
    );
  }

  ReceiverBuilder withAmount({required int amountSats}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiverbuilder_with_amount(
        uniffiClonePointer(),
        FfiConverterUInt64.lower(amountSats),
        status,
      ),
      ReceiverBuilder.lift,
      ffiValidationExceptionErrorHandler,
    );
  }

  ReceiverBuilder withExpiration({required int expirationSecs}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiverbuilder_with_expiration(
        uniffiClonePointer(),
        FfiConverterUInt64.lower(expirationSecs),
        status,
      ),
      ReceiverBuilder.lift,
      ffiValidationExceptionErrorHandler,
    );
  }

  ReceiverBuilder withMaxFeeRate({required int maxEffectiveFeeRateSatPerVb}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receiverbuilder_with_max_fee_rate(
            uniffiClonePointer(),
            FfiConverterUInt64.lower(maxEffectiveFeeRateSatPerVb),
            status,
          ),
      ReceiverBuilder.lift,
      feeRateExceptionErrorHandler,
    );
  }
}

abstract class ReceiverPendingFallbackInterface {
  PendingFallbackTransition close();
  Uint8List fallbackTx();
}

final _ReceiverPendingFallbackFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_receiverpendingfallback(ptr, status),
  );
});

class ReceiverPendingFallback implements ReceiverPendingFallbackInterface {
  late final Pointer<Void> _ptr;

  ReceiverPendingFallback._(this._ptr) {
    _ReceiverPendingFallbackFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverPendingFallback.lift(Pointer<Void> ptr) {
    return ReceiverPendingFallback._(ptr);
  }

  static Pointer<Void> lower(ReceiverPendingFallback value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_receiverpendingfallback(_ptr, status),
    );
  }

  static int allocationSize(ReceiverPendingFallback value) {
    return 8;
  }

  static LiftRetVal<ReceiverPendingFallback> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverPendingFallback.lift(pointer), 8);
  }

  static int write(ReceiverPendingFallback value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverPendingFallbackFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_receiverpendingfallback(_ptr, status),
    );
  }

  PendingFallbackTransition close() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiverpendingfallback_close(
        uniffiClonePointer(),
        status,
      ),
      PendingFallbackTransition.lift,
      null,
    );
  }

  Uint8List fallbackTx() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receiverpendingfallback_fallback_tx(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterUint8List.lift,
      null,
    );
  }
}

abstract class ReceiverSessionEventInterface {
  String toJson();
}

final _ReceiverSessionEventFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_receiversessionevent(ptr, status),
  );
});

class ReceiverSessionEvent implements ReceiverSessionEventInterface {
  late final Pointer<Void> _ptr;

  ReceiverSessionEvent._(this._ptr) {
    _ReceiverSessionEventFinalizer.attach(this, _ptr, detach: this);
  }

  ReceiverSessionEvent.fromJson({required String json})
    : _ptr = rustCall(
        (status) =>
            uniffi_payjoin_ffi_fn_constructor_receiversessionevent_from_json(
              FfiConverterString.lower(json),
              status,
            ),
        serdeJsonExceptionErrorHandler,
      ) {
    _ReceiverSessionEventFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverSessionEvent.lift(Pointer<Void> ptr) {
    return ReceiverSessionEvent._(ptr);
  }

  static Pointer<Void> lower(ReceiverSessionEvent value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_receiversessionevent(_ptr, status),
    );
  }

  static int allocationSize(ReceiverSessionEvent value) {
    return 8;
  }

  static LiftRetVal<ReceiverSessionEvent> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverSessionEvent.lift(pointer), 8);
  }

  static int write(ReceiverSessionEvent value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverSessionEventFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_receiversessionevent(_ptr, status),
    );
  }

  String toJson() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiversessionevent_to_json(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      serdeJsonExceptionErrorHandler,
    );
  }
}

abstract class ReceiverSessionHistoryInterface {
  Uint8List? fallbackTx();
  PjUri pjUri();
  ReceiverSessionStatus status();
}

final _ReceiverSessionHistoryFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_receiversessionhistory(ptr, status),
  );
});

class ReceiverSessionHistory implements ReceiverSessionHistoryInterface {
  late final Pointer<Void> _ptr;

  ReceiverSessionHistory._(this._ptr) {
    _ReceiverSessionHistoryFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverSessionHistory.lift(Pointer<Void> ptr) {
    return ReceiverSessionHistory._(ptr);
  }

  static Pointer<Void> lower(ReceiverSessionHistory value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_receiversessionhistory(_ptr, status),
    );
  }

  static int allocationSize(ReceiverSessionHistory value) {
    return 8;
  }

  static LiftRetVal<ReceiverSessionHistory> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverSessionHistory.lift(pointer), 8);
  }

  static int write(ReceiverSessionHistory value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverSessionHistoryFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_receiversessionhistory(_ptr, status),
    );
  }

  Uint8List? fallbackTx() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receiversessionhistory_fallback_tx(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterOptionalUint8List.lift,
      null,
    );
  }

  PjUri pjUri() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiversessionhistory_pj_uri(
        uniffiClonePointer(),
        status,
      ),
      PjUri.lift,
      null,
    );
  }

  ReceiverSessionStatus status() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiversessionhistory_status(
        uniffiClonePointer(),
        status,
      ),
      ReceiverSessionStatus.lift,
      null,
    );
  }
}

abstract class ReceiverSessionOutcomeInterface {}

final _ReceiverSessionOutcomeFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_receiversessionoutcome(ptr, status),
  );
});

class ReceiverSessionOutcome implements ReceiverSessionOutcomeInterface {
  late final Pointer<Void> _ptr;

  ReceiverSessionOutcome._(this._ptr) {
    _ReceiverSessionOutcomeFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverSessionOutcome.lift(Pointer<Void> ptr) {
    return ReceiverSessionOutcome._(ptr);
  }

  static Pointer<Void> lower(ReceiverSessionOutcome value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_receiversessionoutcome(_ptr, status),
    );
  }

  static int allocationSize(ReceiverSessionOutcome value) {
    return 8;
  }

  static LiftRetVal<ReceiverSessionOutcome> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverSessionOutcome.lift(pointer), 8);
  }

  static int write(ReceiverSessionOutcome value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverSessionOutcomeFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_receiversessionoutcome(_ptr, status),
    );
  }
}

abstract class ReceiverSessionStatusInterface {}

final _ReceiverSessionStatusFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_receiversessionstatus(ptr, status),
  );
});

class ReceiverSessionStatus implements ReceiverSessionStatusInterface {
  late final Pointer<Void> _ptr;

  ReceiverSessionStatus._(this._ptr) {
    _ReceiverSessionStatusFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverSessionStatus.lift(Pointer<Void> ptr) {
    return ReceiverSessionStatus._(ptr);
  }

  static Pointer<Void> lower(ReceiverSessionStatus value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_receiversessionstatus(_ptr, status),
    );
  }

  static int allocationSize(ReceiverSessionStatus value) {
    return 8;
  }

  static LiftRetVal<ReceiverSessionStatus> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverSessionStatus.lift(pointer), 8);
  }

  static int write(ReceiverSessionStatus value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverSessionStatusFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_receiversessionstatus(_ptr, status),
    );
  }
}

abstract class ReplayResultInterface {
  ReceiverSessionHistory sessionHistory();
  ReceiveSession state();
}

final _ReplayResultFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_replayresult(ptr, status));
});

class ReplayResult implements ReplayResultInterface {
  late final Pointer<Void> _ptr;

  ReplayResult._(this._ptr) {
    _ReplayResultFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReplayResult.lift(Pointer<Void> ptr) {
    return ReplayResult._(ptr);
  }

  static Pointer<Void> lower(ReplayResult value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_replayresult(_ptr, status),
    );
  }

  static int allocationSize(ReplayResult value) {
    return 8;
  }

  static LiftRetVal<ReplayResult> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReplayResult.lift(pointer), 8);
  }

  static int write(ReplayResult value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReplayResultFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_replayresult(_ptr, status));
  }

  ReceiverSessionHistory sessionHistory() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_replayresult_session_history(
        uniffiClonePointer(),
        status,
      ),
      ReceiverSessionHistory.lift,
      null,
    );
  }

  ReceiveSession state() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_replayresult_state(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterReceiveSession.lift,
      null,
    );
  }
}

abstract class TransactionFinder {
  Uint8List? callback(String txid);
}

class FfiConverterCallbackInterfaceTransactionFinder {
  static final _handleMap = UniffiHandleMap<TransactionFinder>();
  static bool _vtableInitialized = false;

  static TransactionFinder lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _TransactionFinderImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(TransactionFinder value) {
    if (value is _TransactionFinderImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initTransactionFinderVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<TransactionFinder> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(TransactionFinder value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(TransactionFinder value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceTransactionFinderMethod0 =
    Void Function(
      Uint64,
      RustBuffer,
      Pointer<RustBuffer>,
      Pointer<RustCallStatus>,
    );
typedef UniffiCallbackInterfaceTransactionFinderMethod0Dart =
    void Function(
      int,
      RustBuffer,
      Pointer<RustBuffer>,
      Pointer<RustCallStatus>,
    );
typedef UniffiCallbackInterfaceTransactionFinderFree = Void Function(Uint64);
typedef UniffiCallbackInterfaceTransactionFinderFreeDart = void Function(int);
typedef UniffiCallbackInterfaceTransactionFinderClone = Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceTransactionFinderCloneDart = int Function(int);

final class _TransactionFinderImpl implements TransactionFinder {
  _TransactionFinderImpl._internal(this._ptr) {
    _TransactionFinderImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>> _TransactionFinderImplFinalizer =
      Finalizer<Pointer<Void>>((ptr) {
        rustCall(
          (status) => uniffi_payjoin_ffi_fn_free_transactionfinder(ptr, status),
        );
      });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_transactionfinder(_ptr, status),
    );
  }

  void dispose() {
    _TransactionFinderImplFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_transactionfinder(_ptr, status),
    );
  }

  @override
  Uint8List? callback(String txid) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_transactionfinder_callback(
        uniffiClonePointer(),
        FfiConverterString.lower(txid),
        status,
      ),
      FfiConverterOptionalUint8List.lift,
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceTransactionFinder extends Struct {
  external Pointer<NativeFunction<UniffiCallbackInterfaceTransactionFinderFree>>
  uniffiFree;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceTransactionFinderClone>
  >
  uniffiClone;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceTransactionFinderMethod0>
  >
  callback;
}

void transactionFinderCallback(
  int uniffiHandle,
  RustBuffer txid,
  Pointer<RustBuffer> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceTransactionFinder._handleMap.get(
      uniffiHandle,
    );
    final arg0 = FfiConverterString.lift(txid);
    final result = obj.callback(arg0);
    if (result == null) {
      outReturn.ref = toRustBuffer(Uint8List.fromList([0]));
    } else {
      final lowered = FfiConverterOptionalUint8List.lower(result);
      outReturn.ref = toRustBuffer(lowered.asUint8List());
    }
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceTransactionFinderMethod0>>
transactionFinderCallbackPointer =
    Pointer.fromFunction<UniffiCallbackInterfaceTransactionFinderMethod0>(
      transactionFinderCallback,
    );

void transactionFinderFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceTransactionFinder._handleMap.remove(handle);
  } catch (e) {}
}

final Pointer<NativeFunction<UniffiCallbackInterfaceTransactionFinderFree>>
transactionFinderFreePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceTransactionFinderFree>(
      transactionFinderFreeCallback,
    );

int transactionFinderCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceTransactionFinder._handleMap.get(
      handle,
    );
    final newHandle = FfiConverterCallbackInterfaceTransactionFinder._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<NativeFunction<UniffiCallbackInterfaceTransactionFinderClone>>
transactionFinderClonePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceTransactionFinderClone>(
      transactionFinderCloneCallback,
      0,
    );
late final Pointer<UniffiVTableCallbackInterfaceTransactionFinder>
transactionFinderVTable;

void initTransactionFinderVTable() {
  if (FfiConverterCallbackInterfaceTransactionFinder._vtableInitialized) {
    return;
  }

  transactionFinderVTable =
      calloc<UniffiVTableCallbackInterfaceTransactionFinder>();
  transactionFinderVTable.ref.uniffiFree = transactionFinderFreePointer;
  transactionFinderVTable.ref.uniffiClone = transactionFinderClonePointer;
  transactionFinderVTable.ref.callback = transactionFinderCallbackPointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_transactionfinder(
      transactionFinderVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceTransactionFinder._vtableInitialized = true;
}

abstract class UncheckedOriginalPayloadInterface {
  AssumeInteractiveTransition assumeInteractiveReceiver();
  CancelTransition cancel();
  UncheckedOriginalPayloadTransition checkBroadcastSuitability({
    required int? minFeeRateSatPerKwu,
    required CanBroadcast canBroadcast,
  });
}

final _UncheckedOriginalPayloadFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_uncheckedoriginalpayload(ptr, status),
  );
});

class UncheckedOriginalPayload implements UncheckedOriginalPayloadInterface {
  late final Pointer<Void> _ptr;

  UncheckedOriginalPayload._(this._ptr) {
    _UncheckedOriginalPayloadFinalizer.attach(this, _ptr, detach: this);
  }

  factory UncheckedOriginalPayload.lift(Pointer<Void> ptr) {
    return UncheckedOriginalPayload._(ptr);
  }

  static Pointer<Void> lower(UncheckedOriginalPayload value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_uncheckedoriginalpayload(_ptr, status),
    );
  }

  static int allocationSize(UncheckedOriginalPayload value) {
    return 8;
  }

  static LiftRetVal<UncheckedOriginalPayload> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(UncheckedOriginalPayload.lift(pointer), 8);
  }

  static int write(UncheckedOriginalPayload value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _UncheckedOriginalPayloadFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_uncheckedoriginalpayload(_ptr, status),
    );
  }

  AssumeInteractiveTransition assumeInteractiveReceiver() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayload_assume_interactive_receiver(
            uniffiClonePointer(),
            status,
          ),
      AssumeInteractiveTransition.lift,
      null,
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayload_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  UncheckedOriginalPayloadTransition checkBroadcastSuitability({
    required int? minFeeRateSatPerKwu,
    required CanBroadcast canBroadcast,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayload_check_broadcast_suitability(
            uniffiClonePointer(),
            FfiConverterOptionalUInt64.lower(minFeeRateSatPerKwu),
            FfiConverterCallbackInterfaceCanBroadcast.lower(canBroadcast),
            status,
          ),
      UncheckedOriginalPayloadTransition.lift,
      ffiValidationExceptionErrorHandler,
    );
  }
}

abstract class UncheckedOriginalPayloadTransitionInterface {
  MaybeInputsOwned save({required JsonReceiverSessionPersister persister});
  Future<MaybeInputsOwned> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _UncheckedOriginalPayloadTransitionFinalizer = Finalizer<Pointer<Void>>((
  ptr,
) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_uncheckedoriginalpayloadtransition(
      ptr,
      status,
    ),
  );
});

class UncheckedOriginalPayloadTransition
    implements UncheckedOriginalPayloadTransitionInterface {
  late final Pointer<Void> _ptr;

  UncheckedOriginalPayloadTransition._(this._ptr) {
    _UncheckedOriginalPayloadTransitionFinalizer.attach(
      this,
      _ptr,
      detach: this,
    );
  }

  factory UncheckedOriginalPayloadTransition.lift(Pointer<Void> ptr) {
    return UncheckedOriginalPayloadTransition._(ptr);
  }

  static Pointer<Void> lower(UncheckedOriginalPayloadTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_uncheckedoriginalpayloadtransition(
            _ptr,
            status,
          ),
    );
  }

  static int allocationSize(UncheckedOriginalPayloadTransition value) {
    return 8;
  }

  static LiftRetVal<UncheckedOriginalPayloadTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(UncheckedOriginalPayloadTransition.lift(pointer), 8);
  }

  static int write(UncheckedOriginalPayloadTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _UncheckedOriginalPayloadTransitionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_uncheckedoriginalpayloadtransition(
        _ptr,
        status,
      ),
    );
  }

  MaybeInputsOwned save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayloadtransition_save(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
              persister,
            ),
            status,
          ),
      MaybeInputsOwned.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<MaybeInputsOwned> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () =>
          uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayloadtransition_save_async(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
              persister,
            ),
          ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => MaybeInputsOwned.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class WantsFeeRangeInterface {
  WantsFeeRangeTransition applyFeeRange({
    required int? minFeeRateSatPerVb,
    required int? maxEffectiveFeeRateSatPerVb,
  });
  CancelTransition cancel();
}

final _WantsFeeRangeFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_wantsfeerange(ptr, status));
});

class WantsFeeRange implements WantsFeeRangeInterface {
  late final Pointer<Void> _ptr;

  WantsFeeRange._(this._ptr) {
    _WantsFeeRangeFinalizer.attach(this, _ptr, detach: this);
  }

  factory WantsFeeRange.lift(Pointer<Void> ptr) {
    return WantsFeeRange._(ptr);
  }

  static Pointer<Void> lower(WantsFeeRange value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_wantsfeerange(_ptr, status),
    );
  }

  static int allocationSize(WantsFeeRange value) {
    return 8;
  }

  static LiftRetVal<WantsFeeRange> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WantsFeeRange.lift(pointer), 8);
  }

  static int write(WantsFeeRange value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WantsFeeRangeFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_wantsfeerange(_ptr, status),
    );
  }

  WantsFeeRangeTransition applyFeeRange({
    required int? minFeeRateSatPerVb,
    required int? maxEffectiveFeeRateSatPerVb,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsfeerange_apply_fee_range(
        uniffiClonePointer(),
        FfiConverterOptionalUInt64.lower(minFeeRateSatPerVb),
        FfiConverterOptionalUInt64.lower(maxEffectiveFeeRateSatPerVb),
        status,
      ),
      WantsFeeRangeTransition.lift,
      ffiValidationExceptionErrorHandler,
    );
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsfeerange_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }
}

abstract class WantsFeeRangeTransitionInterface {
  ProvisionalProposal save({required JsonReceiverSessionPersister persister});
  Future<ProvisionalProposal> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _WantsFeeRangeTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_wantsfeerangetransition(ptr, status),
  );
});

class WantsFeeRangeTransition implements WantsFeeRangeTransitionInterface {
  late final Pointer<Void> _ptr;

  WantsFeeRangeTransition._(this._ptr) {
    _WantsFeeRangeTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory WantsFeeRangeTransition.lift(Pointer<Void> ptr) {
    return WantsFeeRangeTransition._(ptr);
  }

  static Pointer<Void> lower(WantsFeeRangeTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_wantsfeerangetransition(_ptr, status),
    );
  }

  static int allocationSize(WantsFeeRangeTransition value) {
    return 8;
  }

  static LiftRetVal<WantsFeeRangeTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WantsFeeRangeTransition.lift(pointer), 8);
  }

  static int write(WantsFeeRangeTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WantsFeeRangeTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_wantsfeerangetransition(_ptr, status),
    );
  }

  ProvisionalProposal save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsfeerangetransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      ProvisionalProposal.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<ProvisionalProposal> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_wantsfeerangetransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => ProvisionalProposal.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class WantsInputsInterface {
  CancelTransition cancel();
  WantsInputsTransition commitInputs();
  WantsInputs contributeInputs({required List<InputPair> replacementInputs});
  InputPair tryPreservingPrivacy({required List<InputPair> candidateInputs});
}

final _WantsInputsFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_wantsinputs(ptr, status));
});

class WantsInputs implements WantsInputsInterface {
  late final Pointer<Void> _ptr;

  WantsInputs._(this._ptr) {
    _WantsInputsFinalizer.attach(this, _ptr, detach: this);
  }

  factory WantsInputs.lift(Pointer<Void> ptr) {
    return WantsInputs._(ptr);
  }

  static Pointer<Void> lower(WantsInputs value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_wantsinputs(_ptr, status),
    );
  }

  static int allocationSize(WantsInputs value) {
    return 8;
  }

  static LiftRetVal<WantsInputs> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WantsInputs.lift(pointer), 8);
  }

  static int write(WantsInputs value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WantsInputsFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_wantsinputs(_ptr, status));
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsinputs_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  WantsInputsTransition commitInputs() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsinputs_commit_inputs(
        uniffiClonePointer(),
        status,
      ),
      WantsInputsTransition.lift,
      null,
    );
  }

  WantsInputs contributeInputs({required List<InputPair> replacementInputs}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsinputs_contribute_inputs(
        uniffiClonePointer(),
        FfiConverterSequenceInputPair.lower(replacementInputs),
        status,
      ),
      WantsInputs.lift,
      inputContributionExceptionErrorHandler,
    );
  }

  InputPair tryPreservingPrivacy({required List<InputPair> candidateInputs}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_wantsinputs_try_preserving_privacy(
            uniffiClonePointer(),
            FfiConverterSequenceInputPair.lower(candidateInputs),
            status,
          ),
      InputPair.lift,
      coinSelectionExceptionErrorHandler,
    );
  }
}

abstract class WantsInputsTransitionInterface {
  WantsFeeRange save({required JsonReceiverSessionPersister persister});
  Future<WantsFeeRange> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _WantsInputsTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_wantsinputstransition(ptr, status),
  );
});

class WantsInputsTransition implements WantsInputsTransitionInterface {
  late final Pointer<Void> _ptr;

  WantsInputsTransition._(this._ptr) {
    _WantsInputsTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory WantsInputsTransition.lift(Pointer<Void> ptr) {
    return WantsInputsTransition._(ptr);
  }

  static Pointer<Void> lower(WantsInputsTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_wantsinputstransition(_ptr, status),
    );
  }

  static int allocationSize(WantsInputsTransition value) {
    return 8;
  }

  static LiftRetVal<WantsInputsTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WantsInputsTransition.lift(pointer), 8);
  }

  static int write(WantsInputsTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WantsInputsTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_wantsinputstransition(_ptr, status),
    );
  }

  WantsFeeRange save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsinputstransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      WantsFeeRange.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<WantsFeeRange> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_wantsinputstransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => WantsFeeRange.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class WantsOutputsInterface {
  CancelTransition cancel();
  WantsOutputsTransition commitOutputs();
  OutputSubstitution outputSubstitution();
  WantsOutputs replaceReceiverOutputs({
    required List<TxOut> replacementOutputs,
    required Uint8List drainScriptPubkey,
  });
  WantsOutputs substituteReceiverScript({
    required Uint8List outputScriptPubkey,
  });
}

final _WantsOutputsFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_wantsoutputs(ptr, status));
});

class WantsOutputs implements WantsOutputsInterface {
  late final Pointer<Void> _ptr;

  WantsOutputs._(this._ptr) {
    _WantsOutputsFinalizer.attach(this, _ptr, detach: this);
  }

  factory WantsOutputs.lift(Pointer<Void> ptr) {
    return WantsOutputs._(ptr);
  }

  static Pointer<Void> lower(WantsOutputs value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_wantsoutputs(_ptr, status),
    );
  }

  static int allocationSize(WantsOutputs value) {
    return 8;
  }

  static LiftRetVal<WantsOutputs> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WantsOutputs.lift(pointer), 8);
  }

  static int write(WantsOutputs value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WantsOutputsFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_wantsoutputs(_ptr, status));
  }

  CancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsoutputs_cancel(
        uniffiClonePointer(),
        status,
      ),
      CancelTransition.lift,
      null,
    );
  }

  WantsOutputsTransition commitOutputs() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsoutputs_commit_outputs(
        uniffiClonePointer(),
        status,
      ),
      WantsOutputsTransition.lift,
      null,
    );
  }

  OutputSubstitution outputSubstitution() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsoutputs_output_substitution(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterOutputSubstitution.lift,
      null,
    );
  }

  WantsOutputs replaceReceiverOutputs({
    required List<TxOut> replacementOutputs,
    required Uint8List drainScriptPubkey,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_wantsoutputs_replace_receiver_outputs(
            uniffiClonePointer(),
            FfiConverterSequenceTxOut.lower(replacementOutputs),
            FfiConverterUint8List.lower(drainScriptPubkey),
            status,
          ),
      WantsOutputs.lift,
      outputSubstitutionExceptionErrorHandler,
    );
  }

  WantsOutputs substituteReceiverScript({
    required Uint8List outputScriptPubkey,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_wantsoutputs_substitute_receiver_script(
            uniffiClonePointer(),
            FfiConverterUint8List.lower(outputScriptPubkey),
            status,
          ),
      WantsOutputs.lift,
      outputSubstitutionExceptionErrorHandler,
    );
  }
}

abstract class WantsOutputsTransitionInterface {
  WantsInputs save({required JsonReceiverSessionPersister persister});
  Future<WantsInputs> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  });
}

final _WantsOutputsTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_wantsoutputstransition(ptr, status),
  );
});

class WantsOutputsTransition implements WantsOutputsTransitionInterface {
  late final Pointer<Void> _ptr;

  WantsOutputsTransition._(this._ptr) {
    _WantsOutputsTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory WantsOutputsTransition.lift(Pointer<Void> ptr) {
    return WantsOutputsTransition._(ptr);
  }

  static Pointer<Void> lower(WantsOutputsTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_wantsoutputstransition(_ptr, status),
    );
  }

  static int allocationSize(WantsOutputsTransition value) {
    return 8;
  }

  static LiftRetVal<WantsOutputsTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WantsOutputsTransition.lift(pointer), 8);
  }

  static int write(WantsOutputsTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WantsOutputsTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_wantsoutputstransition(_ptr, status),
    );
  }

  WantsInputs save({required JsonReceiverSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wantsoutputstransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
          persister,
        ),
        status,
      ),
      WantsInputs.lift,
      receiverPersistedExceptionErrorHandler,
    );
  }

  Future<WantsInputs> saveAsync({
    required JsonReceiverSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_wantsoutputstransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => WantsInputs.lift(Pointer<Void>.fromAddress(ptr)),
      receiverPersistedExceptionErrorHandler,
    );
  }
}

abstract class AddressParseExceptionInterface {}

final _AddressParseExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_addressparseerror(ptr, status),
  );
});

class AddressParseException implements AddressParseExceptionInterface {
  late final Pointer<Void> _ptr;

  AddressParseException._(this._ptr) {
    _AddressParseExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory AddressParseException.lift(Pointer<Void> ptr) {
    return AddressParseException._(ptr);
  }

  static Pointer<Void> lower(AddressParseException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_addressparseerror(_ptr, status),
    );
  }

  static int allocationSize(AddressParseException value) {
    return 8;
  }

  static LiftRetVal<AddressParseException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(AddressParseException.lift(pointer), 8);
  }

  static int write(AddressParseException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _AddressParseExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_addressparseerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_addressparseerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_addressparseerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class CoinSelectionExceptionInterface {}

final _CoinSelectionExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_coinselectionerror(ptr, status),
  );
});

class CoinSelectionException
    implements CoinSelectionExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  CoinSelectionException._(this._ptr) {
    _CoinSelectionExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory CoinSelectionException.lift(Pointer<Void> ptr) {
    return CoinSelectionException._(ptr);
  }

  static Pointer<Void> lower(CoinSelectionException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_coinselectionerror(_ptr, status),
    );
  }

  static int allocationSize(CoinSelectionException value) {
    return 8;
  }

  static LiftRetVal<CoinSelectionException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(CoinSelectionException.lift(pointer), 8);
  }

  static int write(CoinSelectionException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _CoinSelectionExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_coinselectionerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_coinselectionerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_coinselectionerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

class CoinSelectionExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return CoinSelectionException.read(errorBuf.asUint8List()).value;
  }
}

final CoinSelectionExceptionErrorHandler coinSelectionExceptionErrorHandler =
    CoinSelectionExceptionErrorHandler();

abstract class InputContributionExceptionInterface {}

final _InputContributionExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_inputcontributionerror(ptr, status),
  );
});

class InputContributionException
    implements InputContributionExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  InputContributionException._(this._ptr) {
    _InputContributionExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory InputContributionException.lift(Pointer<Void> ptr) {
    return InputContributionException._(ptr);
  }

  static Pointer<Void> lower(InputContributionException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_inputcontributionerror(_ptr, status),
    );
  }

  static int allocationSize(InputContributionException value) {
    return 8;
  }

  static LiftRetVal<InputContributionException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(InputContributionException.lift(pointer), 8);
  }

  static int write(InputContributionException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _InputContributionExceptionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_inputcontributionerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_inputcontributionerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_inputcontributionerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

class InputContributionExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return InputContributionException.read(errorBuf.asUint8List()).value;
  }
}

final InputContributionExceptionErrorHandler
inputContributionExceptionErrorHandler =
    InputContributionExceptionErrorHandler();

abstract class JsonReplyInterface {}

final _JsonReplyFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_jsonreply(ptr, status));
});

class JsonReply implements JsonReplyInterface {
  late final Pointer<Void> _ptr;

  JsonReply._(this._ptr) {
    _JsonReplyFinalizer.attach(this, _ptr, detach: this);
  }

  factory JsonReply.lift(Pointer<Void> ptr) {
    return JsonReply._(ptr);
  }

  static Pointer<Void> lower(JsonReply value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_jsonreply(_ptr, status),
    );
  }

  static int allocationSize(JsonReply value) {
    return 8;
  }

  static LiftRetVal<JsonReply> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(JsonReply.lift(pointer), 8);
  }

  static int write(JsonReply value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _JsonReplyFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_jsonreply(_ptr, status));
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_jsonreply_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! JsonReply) {
      return false;
    }
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_jsonreply_uniffi_trait_eq_eq(
        uniffiClonePointer(),
        JsonReply.lower(other),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }
}

abstract class OutputSubstitutionProtocolExceptionInterface {}

final _OutputSubstitutionProtocolExceptionFinalizer = Finalizer<Pointer<Void>>((
  ptr,
) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_outputsubstitutionprotocolerror(ptr, status),
  );
});

class OutputSubstitutionProtocolException
    implements OutputSubstitutionProtocolExceptionInterface {
  late final Pointer<Void> _ptr;

  OutputSubstitutionProtocolException._(this._ptr) {
    _OutputSubstitutionProtocolExceptionFinalizer.attach(
      this,
      _ptr,
      detach: this,
    );
  }

  factory OutputSubstitutionProtocolException.lift(Pointer<Void> ptr) {
    return OutputSubstitutionProtocolException._(ptr);
  }

  static Pointer<Void> lower(OutputSubstitutionProtocolException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_outputsubstitutionprotocolerror(
        _ptr,
        status,
      ),
    );
  }

  static int allocationSize(OutputSubstitutionProtocolException value) {
    return 8;
  }

  static LiftRetVal<OutputSubstitutionProtocolException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(OutputSubstitutionProtocolException.lift(pointer), 8);
  }

  static int write(OutputSubstitutionProtocolException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _OutputSubstitutionProtocolExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_outputsubstitutionprotocolerror(
        _ptr,
        status,
      ),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_outputsubstitutionprotocolerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_outputsubstitutionprotocolerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class ProtocolExceptionInterface {}

final _ProtocolExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_protocolerror(ptr, status));
});

class ProtocolException implements ProtocolExceptionInterface {
  late final Pointer<Void> _ptr;

  ProtocolException._(this._ptr) {
    _ProtocolExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory ProtocolException.lift(Pointer<Void> ptr) {
    return ProtocolException._(ptr);
  }

  static Pointer<Void> lower(ProtocolException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_protocolerror(_ptr, status),
    );
  }

  static int allocationSize(ProtocolException value) {
    return 8;
  }

  static LiftRetVal<ProtocolException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ProtocolException.lift(pointer), 8);
  }

  static int write(ProtocolException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ProtocolExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_protocolerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_protocolerror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_protocolerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class PsbtInputExceptionInterface {}

final _PsbtInputExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_psbtinputerror(ptr, status));
});

class PsbtInputException implements PsbtInputExceptionInterface {
  late final Pointer<Void> _ptr;

  PsbtInputException._(this._ptr) {
    _PsbtInputExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory PsbtInputException.lift(Pointer<Void> ptr) {
    return PsbtInputException._(ptr);
  }

  static Pointer<Void> lower(PsbtInputException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_psbtinputerror(_ptr, status),
    );
  }

  static int allocationSize(PsbtInputException value) {
    return 8;
  }

  static LiftRetVal<PsbtInputException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PsbtInputException.lift(pointer), 8);
  }

  static int write(PsbtInputException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PsbtInputExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_psbtinputerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_psbtinputerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_psbtinputerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class ReceiverCreateRequestExceptionInterface {
  bool isExpired();
}

final _ReceiverCreateRequestExceptionFinalizer = Finalizer<Pointer<Void>>((
  ptr,
) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_receivercreaterequesterror(ptr, status),
  );
});

class ReceiverCreateRequestException
    implements ReceiverCreateRequestExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  ReceiverCreateRequestException._(this._ptr) {
    _ReceiverCreateRequestExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverCreateRequestException.lift(Pointer<Void> ptr) {
    return ReceiverCreateRequestException._(ptr);
  }

  static Pointer<Void> lower(ReceiverCreateRequestException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_receivercreaterequesterror(_ptr, status),
    );
  }

  static int allocationSize(ReceiverCreateRequestException value) {
    return 8;
  }

  static LiftRetVal<ReceiverCreateRequestException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverCreateRequestException.lift(pointer), 8);
  }

  static int write(ReceiverCreateRequestException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverCreateRequestExceptionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_receivercreaterequesterror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receivercreaterequesterror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receivercreaterequesterror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  bool isExpired() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receivercreaterequesterror_is_expired(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterBool.lift,
      null,
    );
  }
}

class ReceiverCreateRequestExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return ReceiverCreateRequestException.read(errorBuf.asUint8List()).value;
  }
}

final ReceiverCreateRequestExceptionErrorHandler
receiverCreateRequestExceptionErrorHandler =
    ReceiverCreateRequestExceptionErrorHandler();

abstract class ReceiverReplayExceptionInterface {
  bool isExpired();
}

final _ReceiverReplayExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_receiverreplayerror(ptr, status),
  );
});

class ReceiverReplayException
    implements ReceiverReplayExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  ReceiverReplayException._(this._ptr) {
    _ReceiverReplayExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory ReceiverReplayException.lift(Pointer<Void> ptr) {
    return ReceiverReplayException._(ptr);
  }

  static Pointer<Void> lower(ReceiverReplayException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_receiverreplayerror(_ptr, status),
    );
  }

  static int allocationSize(ReceiverReplayException value) {
    return 8;
  }

  static LiftRetVal<ReceiverReplayException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ReceiverReplayException.lift(pointer), 8);
  }

  static int write(ReceiverReplayException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ReceiverReplayExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_receiverreplayerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receiverreplayerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_receiverreplayerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  bool isExpired() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_receiverreplayerror_is_expired(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }
}

class ReceiverReplayExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return ReceiverReplayException.read(errorBuf.asUint8List()).value;
  }
}

final ReceiverReplayExceptionErrorHandler receiverReplayExceptionErrorHandler =
    ReceiverReplayExceptionErrorHandler();

abstract class SessionExceptionInterface {}

final _SessionExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_sessionerror(ptr, status));
});

class SessionException implements SessionExceptionInterface {
  late final Pointer<Void> _ptr;

  SessionException._(this._ptr) {
    _SessionExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory SessionException.lift(Pointer<Void> ptr) {
    return SessionException._(ptr);
  }

  static Pointer<Void> lower(SessionException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_sessionerror(_ptr, status),
    );
  }

  static int allocationSize(SessionException value) {
    return 8;
  }

  static LiftRetVal<SessionException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SessionException.lift(pointer), 8);
  }

  static int write(SessionException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SessionExceptionFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_sessionerror(_ptr, status));
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sessionerror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_sessionerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class BroadcastedTransitionInterface {
  void save({required JsonSenderSessionPersister persister});
  Future<void> saveAsync({required JsonSenderSessionPersisterAsync persister});
}

final _BroadcastedTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_broadcastedtransition(ptr, status),
  );
});

class BroadcastedTransition implements BroadcastedTransitionInterface {
  late final Pointer<Void> _ptr;

  BroadcastedTransition._(this._ptr) {
    _BroadcastedTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory BroadcastedTransition.lift(Pointer<Void> ptr) {
    return BroadcastedTransition._(ptr);
  }

  static Pointer<Void> lower(BroadcastedTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_broadcastedtransition(_ptr, status),
    );
  }

  static int allocationSize(BroadcastedTransition value) {
    return 8;
  }

  static LiftRetVal<BroadcastedTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(BroadcastedTransition.lift(pointer), 8);
  }

  static int write(BroadcastedTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _BroadcastedTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_broadcastedtransition(_ptr, status),
    );
  }

  void save({required JsonSenderSessionPersister persister}) {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_broadcastedtransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersister.lower(
          persister,
        ),
        status,
      );
    }, senderPersistedExceptionErrorHandler);
  }

  Future<void> saveAsync({required JsonSenderSessionPersisterAsync persister}) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_broadcastedtransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      senderPersistedExceptionErrorHandler,
    );
  }
}

abstract class InitialSendTransitionInterface {
  WithReplyKey save({required JsonSenderSessionPersister persister});
  Future<WithReplyKey> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  });
}

final _InitialSendTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_initialsendtransition(ptr, status),
  );
});

class InitialSendTransition implements InitialSendTransitionInterface {
  late final Pointer<Void> _ptr;

  InitialSendTransition._(this._ptr) {
    _InitialSendTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory InitialSendTransition.lift(Pointer<Void> ptr) {
    return InitialSendTransition._(ptr);
  }

  static Pointer<Void> lower(InitialSendTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_initialsendtransition(_ptr, status),
    );
  }

  static int allocationSize(InitialSendTransition value) {
    return 8;
  }

  static LiftRetVal<InitialSendTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(InitialSendTransition.lift(pointer), 8);
  }

  static int write(InitialSendTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _InitialSendTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_initialsendtransition(_ptr, status),
    );
  }

  WithReplyKey save({required JsonSenderSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_initialsendtransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersister.lower(
          persister,
        ),
        status,
      ),
      WithReplyKey.lift,
      foreignExceptionErrorHandler,
    );
  }

  Future<WithReplyKey> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_initialsendtransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => WithReplyKey.lift(Pointer<Void>.fromAddress(ptr)),
      foreignExceptionErrorHandler,
    );
  }
}

abstract class JsonSenderSessionPersister {
  void save(String event);
  List<String> load();
  void close();
}

class FfiConverterCallbackInterfaceJsonSenderSessionPersister {
  static final _handleMap = UniffiHandleMap<JsonSenderSessionPersister>();
  static bool _vtableInitialized = false;

  static JsonSenderSessionPersister lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _JsonSenderSessionPersisterImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(JsonSenderSessionPersister value) {
    if (value is _JsonSenderSessionPersisterImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initJsonSenderSessionPersisterVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<JsonSenderSessionPersister> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(JsonSenderSessionPersister value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(JsonSenderSessionPersister value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceJsonSenderSessionPersisterMethod0 =
    Void Function(Uint64, RustBuffer, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterMethod0Dart =
    void Function(int, RustBuffer, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterMethod1 =
    Void Function(Uint64, Pointer<RustBuffer>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterMethod1Dart =
    void Function(int, Pointer<RustBuffer>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterMethod2 =
    Void Function(Uint64, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterMethod2Dart =
    void Function(int, Pointer<Void>, Pointer<RustCallStatus>);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterFree =
    Void Function(Uint64);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterFreeDart =
    void Function(int);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterClone =
    Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterCloneDart =
    int Function(int);

final class _JsonSenderSessionPersisterImpl
    implements JsonSenderSessionPersister {
  _JsonSenderSessionPersisterImpl._internal(this._ptr) {
    _JsonSenderSessionPersisterImplFinalizer.attach(this, _ptr, detach: this);
  }

  static final Finalizer<Pointer<Void>>
  _JsonSenderSessionPersisterImplFinalizer = Finalizer<Pointer<Void>>((ptr) {
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_jsonsendersessionpersister(ptr, status),
    );
  });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_jsonsendersessionpersister(_ptr, status),
    );
  }

  void dispose() {
    _JsonSenderSessionPersisterImplFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_jsonsendersessionpersister(_ptr, status),
    );
  }

  @override
  void save(String event) {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_jsonsendersessionpersister_save(
        uniffiClonePointer(),
        FfiConverterString.lower(event),
        status,
      );
    }, foreignExceptionErrorHandler);
  }

  @override
  List<String> load() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_jsonsendersessionpersister_load(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterSequenceString.lift,
      foreignExceptionErrorHandler,
    );
  }

  @override
  void close() {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_jsonsendersessionpersister_close(
        uniffiClonePointer(),
        status,
      );
    }, foreignExceptionErrorHandler);
  }
}

final class UniffiVTableCallbackInterfaceJsonSenderSessionPersister
    extends Struct {
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterFree>
  >
  uniffiFree;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterClone>
  >
  uniffiClone;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterMethod0>
  >
  save;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterMethod1>
  >
  load;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterMethod2>
  >
  close;
}

void jsonSenderSessionPersisterSave(
  int uniffiHandle,
  RustBuffer event,
  Pointer<Void> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersister
        ._handleMap
        .get(uniffiHandle);
    final arg0 = FfiConverterString.lift(event);
    obj.save(arg0);
    status.code = CALL_SUCCESS;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterMethod0>
>
jsonSenderSessionPersisterSavePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterMethod0
    >(jsonSenderSessionPersisterSave);
void jsonSenderSessionPersisterLoad(
  int uniffiHandle,
  Pointer<RustBuffer> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersister
        ._handleMap
        .get(uniffiHandle);
    final result = obj.load();
    outReturn.ref = FfiConverterSequenceString.lower(result);
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterMethod1>
>
jsonSenderSessionPersisterLoadPointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterMethod1
    >(jsonSenderSessionPersisterLoad);
void jsonSenderSessionPersisterClose(
  int uniffiHandle,
  Pointer<Void> outReturn,
  Pointer<RustCallStatus> callStatus,
) {
  final status = callStatus.ref;
  try {
    final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersister
        ._handleMap
        .get(uniffiHandle);
    obj.close();
    status.code = CALL_SUCCESS;
  } catch (e) {
    if (e is ForeignException) {
      status.code = CALL_ERROR;
      status.errorBuf = FfiConverterForeignException.lower(e);
    } else {
      status.code = CALL_UNEXPECTED_ERROR;
      status.errorBuf = FfiConverterString.lower(e.toString());
    }
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterMethod2>
>
jsonSenderSessionPersisterClosePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterMethod2
    >(jsonSenderSessionPersisterClose);

void jsonSenderSessionPersisterFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceJsonSenderSessionPersister._handleMap.remove(
      handle,
    );
  } catch (e) {}
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterFree>
>
jsonSenderSessionPersisterFreePointer =
    Pointer.fromFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterFree>(
      jsonSenderSessionPersisterFreeCallback,
    );

int jsonSenderSessionPersisterCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersister
        ._handleMap
        .get(handle);
    final newHandle = FfiConverterCallbackInterfaceJsonSenderSessionPersister
        ._handleMap
        .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterClone>
>
jsonSenderSessionPersisterClonePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterClone
    >(jsonSenderSessionPersisterCloneCallback, 0);
late final Pointer<UniffiVTableCallbackInterfaceJsonSenderSessionPersister>
jsonSenderSessionPersisterVTable;

void initJsonSenderSessionPersisterVTable() {
  if (FfiConverterCallbackInterfaceJsonSenderSessionPersister
      ._vtableInitialized) {
    return;
  }

  jsonSenderSessionPersisterVTable =
      calloc<UniffiVTableCallbackInterfaceJsonSenderSessionPersister>();
  jsonSenderSessionPersisterVTable.ref.uniffiFree =
      jsonSenderSessionPersisterFreePointer;
  jsonSenderSessionPersisterVTable.ref.uniffiClone =
      jsonSenderSessionPersisterClonePointer;
  jsonSenderSessionPersisterVTable.ref.save =
      jsonSenderSessionPersisterSavePointer;
  jsonSenderSessionPersisterVTable.ref.load =
      jsonSenderSessionPersisterLoadPointer;
  jsonSenderSessionPersisterVTable.ref.close =
      jsonSenderSessionPersisterClosePointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_jsonsendersessionpersister(
      jsonSenderSessionPersisterVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceJsonSenderSessionPersister._vtableInitialized =
      true;
}

abstract class JsonSenderSessionPersisterAsync {
  Future<void> save(String event);
  Future<List<String>> load();
  Future<void> close();
}

class FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync {
  static final _handleMap = UniffiHandleMap<JsonSenderSessionPersisterAsync>();
  static bool _vtableInitialized = false;

  static JsonSenderSessionPersisterAsync lift(Pointer<Void> handle) {
    final rawHandle = handle.address;
    if ((rawHandle & 0x1) == 0) {
      return _JsonSenderSessionPersisterAsyncImpl._internal(handle);
    }
    return _handleMap.remove(rawHandle);
  }

  static Pointer<Void> lower(JsonSenderSessionPersisterAsync value) {
    if (value is _JsonSenderSessionPersisterAsyncImpl) {
      return value.uniffiClonePointer();
    }
    _ensureVTableInitialized();
    final handle = _handleMap.insert(value);
    return Pointer<Void>.fromAddress(handle);
  }

  static void _ensureVTableInitialized() {
    if (!_vtableInitialized) {
      initJsonSenderSessionPersisterAsyncVTable();
      _vtableInitialized = true;
    }
  }

  static LiftRetVal<JsonSenderSessionPersisterAsync> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(lift(pointer), 8);
  }

  static int write(JsonSenderSessionPersisterAsync value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  static int allocationSize(JsonSenderSessionPersisterAsync value) {
    return 8;
  }
}

typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod0 =
    Void Function(
      Uint64,
      RustBuffer,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      Uint64,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod0Dart =
    void Function(
      int,
      RustBuffer,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      int,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod1 =
    Void Function(
      Uint64,
      Pointer<NativeFunction<UniffiForeignFutureCompleteRustBuffer>>,
      Uint64,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod1Dart =
    void Function(
      int,
      Pointer<NativeFunction<UniffiForeignFutureCompleteRustBuffer>>,
      int,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod2 =
    Void Function(
      Uint64,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      Uint64,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod2Dart =
    void Function(
      int,
      Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>>,
      int,
      Pointer<UniffiForeignFuture>,
    );
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncFree =
    Void Function(Uint64);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncFreeDart =
    void Function(int);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncClone =
    Uint64 Function(Uint64);
typedef UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncCloneDart =
    int Function(int);

final class _JsonSenderSessionPersisterAsyncImpl
    implements JsonSenderSessionPersisterAsync {
  _JsonSenderSessionPersisterAsyncImpl._internal(this._ptr) {
    _JsonSenderSessionPersisterAsyncImplFinalizer.attach(
      this,
      _ptr,
      detach: this,
    );
  }

  static final Finalizer<Pointer<Void>>
  _JsonSenderSessionPersisterAsyncImplFinalizer = Finalizer<Pointer<Void>>((
    ptr,
  ) {
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_jsonsendersessionpersisterasync(
        ptr,
        status,
      ),
    );
  });

  Pointer<Void> _ptr;

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_jsonsendersessionpersisterasync(
        _ptr,
        status,
      ),
    );
  }

  void dispose() {
    _JsonSenderSessionPersisterAsyncImplFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_jsonsendersessionpersisterasync(
        _ptr,
        status,
      ),
    );
  }

  @override
  Future<void> save(String event) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_jsonsendersessionpersisterasync_save(
        uniffiClonePointer(),
        FfiConverterString.lower(event),
      ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      foreignExceptionErrorHandler,
    );
  }

  @override
  Future<List<String>> load() {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_jsonsendersessionpersisterasync_load(
        uniffiClonePointer(),
      ),
      ffi_payjoin_ffi_rust_future_poll_rust_buffer,
      ffi_payjoin_ffi_rust_future_complete_rust_buffer,
      ffi_payjoin_ffi_rust_future_free_rust_buffer,
      FfiConverterSequenceString.lift,
      foreignExceptionErrorHandler,
    );
  }

  @override
  Future<void> close() {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_jsonsendersessionpersisterasync_close(
        uniffiClonePointer(),
      ),
      ffi_payjoin_ffi_rust_future_poll_void,
      ffi_payjoin_ffi_rust_future_complete_void,
      ffi_payjoin_ffi_rust_future_free_void,
      (_) {},
      foreignExceptionErrorHandler,
    );
  }
}

final class UniffiVTableCallbackInterfaceJsonSenderSessionPersisterAsync
    extends Struct {
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncFree>
  >
  uniffiFree;
  external Pointer<
    NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncClone>
  >
  uniffiClone;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod0
    >
  >
  save;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod1
    >
  >
  load;
  external Pointer<
    NativeFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod2
    >
  >
  close;
}

void jsonSenderSessionPersisterAsyncSave(
  int uniffiHandle,
  RustBuffer event,
  Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>> uniffiFutureCallback,
  int uniffiCallbackData,
  Pointer<UniffiForeignFuture> outReturn,
) {
  final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync
      ._handleMap
      .get(uniffiHandle);
  final arg0 = FfiConverterString.lift(event);
  final callback = uniffiFutureCallback
      .asFunction<UniffiForeignFutureCompleteVoidDart>();
  final state = _UniffiForeignFutureState();
  final handle = _uniffiForeignFutureHandleMap.insert(state);
  outReturn.ref.handle = handle;
  outReturn.ref.free = _uniffiForeignFutureFreePointer;

  () async {
    try {
      final result = await obj.save(arg0);
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        resultStructPtr.ref.callStatus.code = CALL_SUCCESS;
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    } catch (e) {
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        if (e is ForeignException) {
          resultStructPtr.ref.callStatus.code = CALL_ERROR;
          resultStructPtr.ref.callStatus.errorBuf =
              FfiConverterForeignException.lower(e);
        } else {
          resultStructPtr.ref.callStatus.code = CALL_UNEXPECTED_ERROR;
          resultStructPtr.ref.callStatus.errorBuf = FfiConverterString.lower(
            e.toString(),
          );
        }
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    }
  }();
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod0>
>
jsonSenderSessionPersisterAsyncSavePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod0
    >(jsonSenderSessionPersisterAsyncSave);
void jsonSenderSessionPersisterAsyncLoad(
  int uniffiHandle,
  Pointer<NativeFunction<UniffiForeignFutureCompleteRustBuffer>>
  uniffiFutureCallback,
  int uniffiCallbackData,
  Pointer<UniffiForeignFuture> outReturn,
) {
  final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync
      ._handleMap
      .get(uniffiHandle);
  final callback = uniffiFutureCallback
      .asFunction<UniffiForeignFutureCompleteRustBufferDart>();
  final state = _UniffiForeignFutureState();
  final handle = _uniffiForeignFutureHandleMap.insert(state);
  outReturn.ref.handle = handle;
  outReturn.ref.free = _uniffiForeignFutureFreePointer;

  () async {
    try {
      final result = await obj.load();
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultRustBuffer>();
      try {
        resultStructPtr.ref.returnValue = FfiConverterSequenceString.lower(
          result,
        );
        resultStructPtr.ref.callStatus.code = CALL_SUCCESS;
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    } catch (e) {
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultRustBuffer>();
      try {
        if (e is ForeignException) {
          resultStructPtr.ref.callStatus.code = CALL_ERROR;
          resultStructPtr.ref.callStatus.errorBuf =
              FfiConverterForeignException.lower(e);
        } else {
          resultStructPtr.ref.callStatus.code = CALL_UNEXPECTED_ERROR;
          resultStructPtr.ref.callStatus.errorBuf = FfiConverterString.lower(
            e.toString(),
          );
        }
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    }
  }();
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod1>
>
jsonSenderSessionPersisterAsyncLoadPointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod1
    >(jsonSenderSessionPersisterAsyncLoad);
void jsonSenderSessionPersisterAsyncClose(
  int uniffiHandle,
  Pointer<NativeFunction<UniffiForeignFutureCompleteVoid>> uniffiFutureCallback,
  int uniffiCallbackData,
  Pointer<UniffiForeignFuture> outReturn,
) {
  final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync
      ._handleMap
      .get(uniffiHandle);
  final callback = uniffiFutureCallback
      .asFunction<UniffiForeignFutureCompleteVoidDart>();
  final state = _UniffiForeignFutureState();
  final handle = _uniffiForeignFutureHandleMap.insert(state);
  outReturn.ref.handle = handle;
  outReturn.ref.free = _uniffiForeignFutureFreePointer;

  () async {
    try {
      final result = await obj.close();
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        resultStructPtr.ref.callStatus.code = CALL_SUCCESS;
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    } catch (e) {
      final removedState = _uniffiForeignFutureHandleMap.maybeRemove(handle);
      final effectiveState = removedState ?? state;
      if (effectiveState.cancelled) {
        return;
      }
      effectiveState.cancelled = true;
      final resultStructPtr = calloc<UniffiForeignFutureResultVoid>();
      try {
        if (e is ForeignException) {
          resultStructPtr.ref.callStatus.code = CALL_ERROR;
          resultStructPtr.ref.callStatus.errorBuf =
              FfiConverterForeignException.lower(e);
        } else {
          resultStructPtr.ref.callStatus.code = CALL_UNEXPECTED_ERROR;
          resultStructPtr.ref.callStatus.errorBuf = FfiConverterString.lower(
            e.toString(),
          );
        }
        callback(uniffiCallbackData, resultStructPtr.ref);
      } finally {
        calloc.free(resultStructPtr);
      }
    }
  }();
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod2>
>
jsonSenderSessionPersisterAsyncClosePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncMethod2
    >(jsonSenderSessionPersisterAsyncClose);

void jsonSenderSessionPersisterAsyncFreeCallback(int handle) {
  try {
    FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync._handleMap
        .remove(handle);
  } catch (e) {}
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncFree>
>
jsonSenderSessionPersisterAsyncFreePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncFree
    >(jsonSenderSessionPersisterAsyncFreeCallback);

int jsonSenderSessionPersisterAsyncCloneCallback(int handle) {
  try {
    final obj = FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync
        ._handleMap
        .get(handle);
    final newHandle =
        FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync._handleMap
            .insert(obj);
    return newHandle;
  } catch (e) {
    return 0;
  }
}

final Pointer<
  NativeFunction<UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncClone>
>
jsonSenderSessionPersisterAsyncClonePointer =
    Pointer.fromFunction<
      UniffiCallbackInterfaceJsonSenderSessionPersisterAsyncClone
    >(jsonSenderSessionPersisterAsyncCloneCallback, 0);
late final Pointer<UniffiVTableCallbackInterfaceJsonSenderSessionPersisterAsync>
jsonSenderSessionPersisterAsyncVTable;

void initJsonSenderSessionPersisterAsyncVTable() {
  if (FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync
      ._vtableInitialized) {
    return;
  }

  jsonSenderSessionPersisterAsyncVTable =
      calloc<UniffiVTableCallbackInterfaceJsonSenderSessionPersisterAsync>();
  jsonSenderSessionPersisterAsyncVTable.ref.uniffiFree =
      jsonSenderSessionPersisterAsyncFreePointer;
  jsonSenderSessionPersisterAsyncVTable.ref.uniffiClone =
      jsonSenderSessionPersisterAsyncClonePointer;
  jsonSenderSessionPersisterAsyncVTable.ref.save =
      jsonSenderSessionPersisterAsyncSavePointer;
  jsonSenderSessionPersisterAsyncVTable.ref.load =
      jsonSenderSessionPersisterAsyncLoadPointer;
  jsonSenderSessionPersisterAsyncVTable.ref.close =
      jsonSenderSessionPersisterAsyncClosePointer;

  rustCall((status) {
    uniffi_payjoin_ffi_fn_init_callback_vtable_jsonsendersessionpersisterasync(
      jsonSenderSessionPersisterAsyncVTable,
    );
    checkCallStatus(NullRustCallStatusErrorHandler(), status);
  });

  FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync
          ._vtableInitialized =
      true;
}

abstract class PjParamInterface {}

final _PjParamFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_pjparam(ptr, status));
});

class PjParam implements PjParamInterface {
  late final Pointer<Void> _ptr;

  PjParam._(this._ptr) {
    _PjParamFinalizer.attach(this, _ptr, detach: this);
  }

  factory PjParam.lift(Pointer<Void> ptr) {
    return PjParam._(ptr);
  }

  static Pointer<Void> lower(PjParam value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_pjparam(_ptr, status),
    );
  }

  static int allocationSize(PjParam value) {
    return 8;
  }

  static LiftRetVal<PjParam> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PjParam.lift(pointer), 8);
  }

  static int write(PjParam value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PjParamFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_pjparam(_ptr, status));
  }
}

abstract class PollingForProposalInterface {
  SenderCancelTransition cancel();
  RequestOhttpContext createPollRequest({required String ohttpRelay});
  PollingForProposalTransition processResponse({
    required Uint8List response,
    required ClientResponse ohttpCtx,
  });
}

final _PollingForProposalFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_pollingforproposal(ptr, status),
  );
});

class PollingForProposal implements PollingForProposalInterface {
  late final Pointer<Void> _ptr;

  PollingForProposal._(this._ptr) {
    _PollingForProposalFinalizer.attach(this, _ptr, detach: this);
  }

  factory PollingForProposal.lift(Pointer<Void> ptr) {
    return PollingForProposal._(ptr);
  }

  static Pointer<Void> lower(PollingForProposal value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_pollingforproposal(_ptr, status),
    );
  }

  static int allocationSize(PollingForProposal value) {
    return 8;
  }

  static LiftRetVal<PollingForProposal> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PollingForProposal.lift(pointer), 8);
  }

  static int write(PollingForProposal value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PollingForProposalFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_pollingforproposal(_ptr, status),
    );
  }

  SenderCancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pollingforproposal_cancel(
        uniffiClonePointer(),
        status,
      ),
      SenderCancelTransition.lift,
      null,
    );
  }

  RequestOhttpContext createPollRequest({required String ohttpRelay}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pollingforproposal_create_poll_request(
            uniffiClonePointer(),
            FfiConverterString.lower(ohttpRelay),
            status,
          ),
      FfiConverterRequestOhttpContext.lift,
      createRequestExceptionErrorHandler,
    );
  }

  PollingForProposalTransition processResponse({
    required Uint8List response,
    required ClientResponse ohttpCtx,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pollingforproposal_process_response(
            uniffiClonePointer(),
            FfiConverterUint8List.lower(response),
            ClientResponse.lower(ohttpCtx),
            status,
          ),
      PollingForProposalTransition.lift,
      null,
    );
  }
}

abstract class PollingForProposalTransitionInterface {
  PollingForProposalTransitionOutcome save({
    required JsonSenderSessionPersister persister,
  });
  Future<PollingForProposalTransitionOutcome> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  });
}

final _PollingForProposalTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) =>
        uniffi_payjoin_ffi_fn_free_pollingforproposaltransition(ptr, status),
  );
});

class PollingForProposalTransition
    implements PollingForProposalTransitionInterface {
  late final Pointer<Void> _ptr;

  PollingForProposalTransition._(this._ptr) {
    _PollingForProposalTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory PollingForProposalTransition.lift(Pointer<Void> ptr) {
    return PollingForProposalTransition._(ptr);
  }

  static Pointer<Void> lower(PollingForProposalTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_pollingforproposaltransition(
        _ptr,
        status,
      ),
    );
  }

  static int allocationSize(PollingForProposalTransition value) {
    return 8;
  }

  static LiftRetVal<PollingForProposalTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PollingForProposalTransition.lift(pointer), 8);
  }

  static int write(PollingForProposalTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PollingForProposalTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_pollingforproposaltransition(_ptr, status),
    );
  }

  PollingForProposalTransitionOutcome save({
    required JsonSenderSessionPersister persister,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pollingforproposaltransition_save(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceJsonSenderSessionPersister.lower(
              persister,
            ),
            status,
          ),
      FfiConverterPollingForProposalTransitionOutcome.lift,
      senderPersistedExceptionErrorHandler,
    );
  }

  Future<PollingForProposalTransitionOutcome> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () =>
          uniffi_payjoin_ffi_fn_method_pollingforproposaltransition_save_async(
            uniffiClonePointer(),
            FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync.lower(
              persister,
            ),
          ),
      ffi_payjoin_ffi_rust_future_poll_rust_buffer,
      ffi_payjoin_ffi_rust_future_complete_rust_buffer,
      ffi_payjoin_ffi_rust_future_free_rust_buffer,
      FfiConverterPollingForProposalTransitionOutcome.lift,
      senderPersistedExceptionErrorHandler,
    );
  }
}

abstract class SenderBuilderInterface {
  SenderBuilder alwaysDisableOutputSubstitution();
  InitialSendTransition buildNonIncentivizing({
    required int minFeeRateSatPerKwu,
  });
  InitialSendTransition buildRecommended({required int minFeeRateSatPerKwu});
  InitialSendTransition buildWithAdditionalFee({
    required int maxFeeContributionSats,
    required int? changeIndex,
    required int minFeeRateSatPerKwu,
    required bool clampFeeContribution,
  });
}

final _SenderBuilderFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_senderbuilder(ptr, status));
});

class SenderBuilder implements SenderBuilderInterface {
  late final Pointer<Void> _ptr;

  SenderBuilder._(this._ptr) {
    _SenderBuilderFinalizer.attach(this, _ptr, detach: this);
  }

  SenderBuilder({required String psbt, required PjUri uri})
    : _ptr = rustCall(
        (status) => uniffi_payjoin_ffi_fn_constructor_senderbuilder_new(
          FfiConverterString.lower(psbt),
          PjUri.lower(uri),
          status,
        ),
        senderInputExceptionErrorHandler,
      ) {
    _SenderBuilderFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderBuilder.lift(Pointer<Void> ptr) {
    return SenderBuilder._(ptr);
  }

  static Pointer<Void> lower(SenderBuilder value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_senderbuilder(_ptr, status),
    );
  }

  static int allocationSize(SenderBuilder value) {
    return 8;
  }

  static LiftRetVal<SenderBuilder> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderBuilder.lift(pointer), 8);
  }

  static int write(SenderBuilder value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderBuilderFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_senderbuilder(_ptr, status),
    );
  }

  SenderBuilder alwaysDisableOutputSubstitution() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderbuilder_always_disable_output_substitution(
            uniffiClonePointer(),
            status,
          ),
      SenderBuilder.lift,
      null,
    );
  }

  InitialSendTransition buildNonIncentivizing({
    required int minFeeRateSatPerKwu,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderbuilder_build_non_incentivizing(
            uniffiClonePointer(),
            FfiConverterUInt64.lower(minFeeRateSatPerKwu),
            status,
          ),
      InitialSendTransition.lift,
      senderInputExceptionErrorHandler,
    );
  }

  InitialSendTransition buildRecommended({required int minFeeRateSatPerKwu}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_senderbuilder_build_recommended(
        uniffiClonePointer(),
        FfiConverterUInt64.lower(minFeeRateSatPerKwu),
        status,
      ),
      InitialSendTransition.lift,
      senderInputExceptionErrorHandler,
    );
  }

  InitialSendTransition buildWithAdditionalFee({
    required int maxFeeContributionSats,
    required int? changeIndex,
    required int minFeeRateSatPerKwu,
    required bool clampFeeContribution,
  }) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderbuilder_build_with_additional_fee(
            uniffiClonePointer(),
            FfiConverterUInt64.lower(maxFeeContributionSats),
            FfiConverterOptionalUInt8.lower(changeIndex),
            FfiConverterUInt64.lower(minFeeRateSatPerKwu),
            FfiConverterBool.lower(clampFeeContribution),
            status,
          ),
      InitialSendTransition.lift,
      senderInputExceptionErrorHandler,
    );
  }
}

abstract class SenderCancelTransitionInterface {
  SenderPendingFallback save({required JsonSenderSessionPersister persister});
  Future<SenderPendingFallback> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  });
}

final _SenderCancelTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_sendercanceltransition(ptr, status),
  );
});

class SenderCancelTransition implements SenderCancelTransitionInterface {
  late final Pointer<Void> _ptr;

  SenderCancelTransition._(this._ptr) {
    _SenderCancelTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderCancelTransition.lift(Pointer<Void> ptr) {
    return SenderCancelTransition._(ptr);
  }

  static Pointer<Void> lower(SenderCancelTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_sendercanceltransition(_ptr, status),
    );
  }

  static int allocationSize(SenderCancelTransition value) {
    return 8;
  }

  static LiftRetVal<SenderCancelTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderCancelTransition.lift(pointer), 8);
  }

  static int write(SenderCancelTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderCancelTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_sendercanceltransition(_ptr, status),
    );
  }

  SenderPendingFallback save({required JsonSenderSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendercanceltransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersister.lower(
          persister,
        ),
        status,
      ),
      SenderPendingFallback.lift,
      senderPersistedExceptionErrorHandler,
    );
  }

  Future<SenderPendingFallback> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_sendercanceltransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => SenderPendingFallback.lift(Pointer<Void>.fromAddress(ptr)),
      senderPersistedExceptionErrorHandler,
    );
  }
}

abstract class SenderPendingFallbackInterface {
  BroadcastedTransition close();
  Uint8List fallbackTx();
}

final _SenderPendingFallbackFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_senderpendingfallback(ptr, status),
  );
});

class SenderPendingFallback implements SenderPendingFallbackInterface {
  late final Pointer<Void> _ptr;

  SenderPendingFallback._(this._ptr) {
    _SenderPendingFallbackFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderPendingFallback.lift(Pointer<Void> ptr) {
    return SenderPendingFallback._(ptr);
  }

  static Pointer<Void> lower(SenderPendingFallback value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_senderpendingfallback(_ptr, status),
    );
  }

  static int allocationSize(SenderPendingFallback value) {
    return 8;
  }

  static LiftRetVal<SenderPendingFallback> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderPendingFallback.lift(pointer), 8);
  }

  static int write(SenderPendingFallback value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderPendingFallbackFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_senderpendingfallback(_ptr, status),
    );
  }

  BroadcastedTransition close() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_senderpendingfallback_close(
        uniffiClonePointer(),
        status,
      ),
      BroadcastedTransition.lift,
      null,
    );
  }

  Uint8List fallbackTx() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderpendingfallback_fallback_tx(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterUint8List.lift,
      null,
    );
  }
}

abstract class SenderReplayResultInterface {
  SenderSessionHistory sessionHistory();
  SendSession state();
}

final _SenderReplayResultFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_senderreplayresult(ptr, status),
  );
});

class SenderReplayResult implements SenderReplayResultInterface {
  late final Pointer<Void> _ptr;

  SenderReplayResult._(this._ptr) {
    _SenderReplayResultFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderReplayResult.lift(Pointer<Void> ptr) {
    return SenderReplayResult._(ptr);
  }

  static Pointer<Void> lower(SenderReplayResult value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_senderreplayresult(_ptr, status),
    );
  }

  static int allocationSize(SenderReplayResult value) {
    return 8;
  }

  static LiftRetVal<SenderReplayResult> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderReplayResult.lift(pointer), 8);
  }

  static int write(SenderReplayResult value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderReplayResultFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_senderreplayresult(_ptr, status),
    );
  }

  SenderSessionHistory sessionHistory() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderreplayresult_session_history(
            uniffiClonePointer(),
            status,
          ),
      SenderSessionHistory.lift,
      null,
    );
  }

  SendSession state() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_senderreplayresult_state(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterSendSession.lift,
      null,
    );
  }
}

abstract class SenderSessionEventInterface {
  String toJson();
}

final _SenderSessionEventFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_sendersessionevent(ptr, status),
  );
});

class SenderSessionEvent implements SenderSessionEventInterface {
  late final Pointer<Void> _ptr;

  SenderSessionEvent._(this._ptr) {
    _SenderSessionEventFinalizer.attach(this, _ptr, detach: this);
  }

  SenderSessionEvent.fromJson({required String json})
    : _ptr = rustCall(
        (status) =>
            uniffi_payjoin_ffi_fn_constructor_sendersessionevent_from_json(
              FfiConverterString.lower(json),
              status,
            ),
        serdeJsonExceptionErrorHandler,
      ) {
    _SenderSessionEventFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderSessionEvent.lift(Pointer<Void> ptr) {
    return SenderSessionEvent._(ptr);
  }

  static Pointer<Void> lower(SenderSessionEvent value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_sendersessionevent(_ptr, status),
    );
  }

  static int allocationSize(SenderSessionEvent value) {
    return 8;
  }

  static LiftRetVal<SenderSessionEvent> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderSessionEvent.lift(pointer), 8);
  }

  static int write(SenderSessionEvent value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderSessionEventFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_sendersessionevent(_ptr, status),
    );
  }

  String toJson() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendersessionevent_to_json(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      serdeJsonExceptionErrorHandler,
    );
  }
}

abstract class SenderSessionHistoryInterface {
  Uint8List fallbackTx();
  PjParam pjParam();
  SenderSessionStatus status();
}

final _SenderSessionHistoryFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_sendersessionhistory(ptr, status),
  );
});

class SenderSessionHistory implements SenderSessionHistoryInterface {
  late final Pointer<Void> _ptr;

  SenderSessionHistory._(this._ptr) {
    _SenderSessionHistoryFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderSessionHistory.lift(Pointer<Void> ptr) {
    return SenderSessionHistory._(ptr);
  }

  static Pointer<Void> lower(SenderSessionHistory value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_sendersessionhistory(_ptr, status),
    );
  }

  static int allocationSize(SenderSessionHistory value) {
    return 8;
  }

  static LiftRetVal<SenderSessionHistory> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderSessionHistory.lift(pointer), 8);
  }

  static int write(SenderSessionHistory value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderSessionHistoryFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_sendersessionhistory(_ptr, status),
    );
  }

  Uint8List fallbackTx() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendersessionhistory_fallback_tx(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterUint8List.lift,
      null,
    );
  }

  PjParam pjParam() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendersessionhistory_pj_param(
        uniffiClonePointer(),
        status,
      ),
      PjParam.lift,
      null,
    );
  }

  SenderSessionStatus status() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendersessionhistory_status(
        uniffiClonePointer(),
        status,
      ),
      SenderSessionStatus.lift,
      null,
    );
  }
}

abstract class SenderSessionOutcomeInterface {
  bool isAborted();
  bool isSuccess();
  String? successPsbtBase64();
}

final _SenderSessionOutcomeFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_sendersessionoutcome(ptr, status),
  );
});

class SenderSessionOutcome implements SenderSessionOutcomeInterface {
  late final Pointer<Void> _ptr;

  SenderSessionOutcome._(this._ptr) {
    _SenderSessionOutcomeFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderSessionOutcome.lift(Pointer<Void> ptr) {
    return SenderSessionOutcome._(ptr);
  }

  static Pointer<Void> lower(SenderSessionOutcome value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_sendersessionoutcome(_ptr, status),
    );
  }

  static int allocationSize(SenderSessionOutcome value) {
    return 8;
  }

  static LiftRetVal<SenderSessionOutcome> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderSessionOutcome.lift(pointer), 8);
  }

  static int write(SenderSessionOutcome value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderSessionOutcomeFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_sendersessionoutcome(_ptr, status),
    );
  }

  bool isAborted() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendersessionoutcome_is_aborted(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }

  bool isSuccess() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_sendersessionoutcome_is_success(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }

  String? successPsbtBase64() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_sendersessionoutcome_success_psbt_base64(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterOptionalString.lift,
      null,
    );
  }
}

abstract class SenderSessionStatusInterface {}

final _SenderSessionStatusFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_sendersessionstatus(ptr, status),
  );
});

class SenderSessionStatus implements SenderSessionStatusInterface {
  late final Pointer<Void> _ptr;

  SenderSessionStatus._(this._ptr) {
    _SenderSessionStatusFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderSessionStatus.lift(Pointer<Void> ptr) {
    return SenderSessionStatus._(ptr);
  }

  static Pointer<Void> lower(SenderSessionStatus value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_sendersessionstatus(_ptr, status),
    );
  }

  static int allocationSize(SenderSessionStatus value) {
    return 8;
  }

  static LiftRetVal<SenderSessionStatus> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderSessionStatus.lift(pointer), 8);
  }

  static int write(SenderSessionStatus value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderSessionStatusFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_sendersessionstatus(_ptr, status),
    );
  }
}

abstract class V1ContextInterface {
  String processResponse({required Uint8List response});
}

final _V1ContextFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_v1context(ptr, status));
});

class V1Context implements V1ContextInterface {
  late final Pointer<Void> _ptr;

  V1Context._(this._ptr) {
    _V1ContextFinalizer.attach(this, _ptr, detach: this);
  }

  factory V1Context.lift(Pointer<Void> ptr) {
    return V1Context._(ptr);
  }

  static Pointer<Void> lower(V1Context value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_v1context(_ptr, status),
    );
  }

  static int allocationSize(V1Context value) {
    return 8;
  }

  static LiftRetVal<V1Context> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(V1Context.lift(pointer), 8);
  }

  static int write(V1Context value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _V1ContextFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_v1context(_ptr, status));
  }

  String processResponse({required Uint8List response}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_v1context_process_response(
        uniffiClonePointer(),
        FfiConverterUint8List.lower(response),
        status,
      ),
      FfiConverterString.lift,
      responseExceptionErrorHandler,
    );
  }
}

abstract class WithReplyKeyInterface {
  SenderCancelTransition cancel();
  RequestOhttpContext createV2PostRequest({required String ohttpRelay});
  WithReplyKeyTransition processResponse({
    required Uint8List response,
    required ClientResponse postCtx,
  });
}

final _WithReplyKeyFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_withreplykey(ptr, status));
});

class WithReplyKey implements WithReplyKeyInterface {
  late final Pointer<Void> _ptr;

  WithReplyKey._(this._ptr) {
    _WithReplyKeyFinalizer.attach(this, _ptr, detach: this);
  }

  factory WithReplyKey.lift(Pointer<Void> ptr) {
    return WithReplyKey._(ptr);
  }

  static Pointer<Void> lower(WithReplyKey value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_withreplykey(_ptr, status),
    );
  }

  static int allocationSize(WithReplyKey value) {
    return 8;
  }

  static LiftRetVal<WithReplyKey> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WithReplyKey.lift(pointer), 8);
  }

  static int write(WithReplyKey value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WithReplyKeyFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_withreplykey(_ptr, status));
  }

  SenderCancelTransition cancel() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_withreplykey_cancel(
        uniffiClonePointer(),
        status,
      ),
      SenderCancelTransition.lift,
      null,
    );
  }

  RequestOhttpContext createV2PostRequest({required String ohttpRelay}) {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_withreplykey_create_v2_post_request(
            uniffiClonePointer(),
            FfiConverterString.lower(ohttpRelay),
            status,
          ),
      FfiConverterRequestOhttpContext.lift,
      createRequestExceptionErrorHandler,
    );
  }

  WithReplyKeyTransition processResponse({
    required Uint8List response,
    required ClientResponse postCtx,
  }) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_withreplykey_process_response(
        uniffiClonePointer(),
        FfiConverterUint8List.lower(response),
        ClientResponse.lower(postCtx),
        status,
      ),
      WithReplyKeyTransition.lift,
      null,
    );
  }
}

abstract class WithReplyKeyTransitionInterface {
  PollingForProposal save({required JsonSenderSessionPersister persister});
  Future<PollingForProposal> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  });
}

final _WithReplyKeyTransitionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_withreplykeytransition(ptr, status),
  );
});

class WithReplyKeyTransition implements WithReplyKeyTransitionInterface {
  late final Pointer<Void> _ptr;

  WithReplyKeyTransition._(this._ptr) {
    _WithReplyKeyTransitionFinalizer.attach(this, _ptr, detach: this);
  }

  factory WithReplyKeyTransition.lift(Pointer<Void> ptr) {
    return WithReplyKeyTransition._(ptr);
  }

  static Pointer<Void> lower(WithReplyKeyTransition value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_clone_withreplykeytransition(_ptr, status),
    );
  }

  static int allocationSize(WithReplyKeyTransition value) {
    return 8;
  }

  static LiftRetVal<WithReplyKeyTransition> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WithReplyKeyTransition.lift(pointer), 8);
  }

  static int write(WithReplyKeyTransition value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WithReplyKeyTransitionFinalizer.detach(this);
    rustCall(
      (status) =>
          uniffi_payjoin_ffi_fn_free_withreplykeytransition(_ptr, status),
    );
  }

  PollingForProposal save({required JsonSenderSessionPersister persister}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_withreplykeytransition_save(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersister.lower(
          persister,
        ),
        status,
      ),
      PollingForProposal.lift,
      senderPersistedExceptionErrorHandler,
    );
  }

  Future<PollingForProposal> saveAsync({
    required JsonSenderSessionPersisterAsync persister,
  }) {
    return uniffiRustCallAsync(
      () => uniffi_payjoin_ffi_fn_method_withreplykeytransition_save_async(
        uniffiClonePointer(),
        FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync.lower(
          persister,
        ),
      ),
      ffi_payjoin_ffi_rust_future_poll_u64,
      ffi_payjoin_ffi_rust_future_complete_u64,
      ffi_payjoin_ffi_rust_future_free_u64,
      (ptr) => PollingForProposal.lift(Pointer<Void>.fromAddress(ptr)),
      senderPersistedExceptionErrorHandler,
    );
  }
}

abstract class CreateRequestExceptionInterface {
  bool isExpired();
}

final _CreateRequestExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_createrequesterror(ptr, status),
  );
});

class CreateRequestException
    implements CreateRequestExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  CreateRequestException._(this._ptr) {
    _CreateRequestExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory CreateRequestException.lift(Pointer<Void> ptr) {
    return CreateRequestException._(ptr);
  }

  static Pointer<Void> lower(CreateRequestException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_createrequesterror(_ptr, status),
    );
  }

  static int allocationSize(CreateRequestException value) {
    return 8;
  }

  static LiftRetVal<CreateRequestException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(CreateRequestException.lift(pointer), 8);
  }

  static int write(CreateRequestException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _CreateRequestExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_createrequesterror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_createrequesterror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_createrequesterror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  bool isExpired() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_createrequesterror_is_expired(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }
}

class CreateRequestExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return CreateRequestException.read(errorBuf.asUint8List()).value;
  }
}

final CreateRequestExceptionErrorHandler createRequestExceptionErrorHandler =
    CreateRequestExceptionErrorHandler();

abstract class DecapsulationExceptionInterface {}

final _DecapsulationExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_decapsulationerror(ptr, status),
  );
});

class DecapsulationException implements DecapsulationExceptionInterface {
  late final Pointer<Void> _ptr;

  DecapsulationException._(this._ptr) {
    _DecapsulationExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory DecapsulationException.lift(Pointer<Void> ptr) {
    return DecapsulationException._(ptr);
  }

  static Pointer<Void> lower(DecapsulationException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_decapsulationerror(_ptr, status),
    );
  }

  static int allocationSize(DecapsulationException value) {
    return 8;
  }

  static LiftRetVal<DecapsulationException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(DecapsulationException.lift(pointer), 8);
  }

  static int write(DecapsulationException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _DecapsulationExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_decapsulationerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_decapsulationerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_decapsulationerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class SenderBuilderExceptionInterface {}

final _SenderBuilderExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_senderbuildererror(ptr, status),
  );
});

class SenderBuilderException implements SenderBuilderExceptionInterface {
  late final Pointer<Void> _ptr;

  SenderBuilderException._(this._ptr) {
    _SenderBuilderExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderBuilderException.lift(Pointer<Void> ptr) {
    return SenderBuilderException._(ptr);
  }

  static Pointer<Void> lower(SenderBuilderException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_senderbuildererror(_ptr, status),
    );
  }

  static int allocationSize(SenderBuilderException value) {
    return 8;
  }

  static LiftRetVal<SenderBuilderException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderBuilderException.lift(pointer), 8);
  }

  static int write(SenderBuilderException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderBuilderExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_senderbuildererror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! SenderBuilderException) {
      return false;
    }
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_eq_eq(
            uniffiClonePointer(),
            SenderBuilderException.lower(other),
            status,
          ),
      FfiConverterBool.lift,
      null,
    );
  }
}

abstract class SenderReplayExceptionInterface {
  bool isExpired();
}

final _SenderReplayExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_senderreplayerror(ptr, status),
  );
});

class SenderReplayException
    implements SenderReplayExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  SenderReplayException._(this._ptr) {
    _SenderReplayExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory SenderReplayException.lift(Pointer<Void> ptr) {
    return SenderReplayException._(ptr);
  }

  static Pointer<Void> lower(SenderReplayException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_senderreplayerror(_ptr, status),
    );
  }

  static int allocationSize(SenderReplayException value) {
    return 8;
  }

  static LiftRetVal<SenderReplayException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(SenderReplayException.lift(pointer), 8);
  }

  static int write(SenderReplayException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _SenderReplayExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_senderreplayerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderreplayerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_senderreplayerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  bool isExpired() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_senderreplayerror_is_expired(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }
}

class SenderReplayExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return SenderReplayException.read(errorBuf.asUint8List()).value;
  }
}

final SenderReplayExceptionErrorHandler senderReplayExceptionErrorHandler =
    SenderReplayExceptionErrorHandler();

abstract class ValidationExceptionInterface {}

final _ValidationExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_validationerror(ptr, status));
});

class ValidationException implements ValidationExceptionInterface {
  late final Pointer<Void> _ptr;

  ValidationException._(this._ptr) {
    _ValidationExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory ValidationException.lift(Pointer<Void> ptr) {
    return ValidationException._(ptr);
  }

  static Pointer<Void> lower(ValidationException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_validationerror(_ptr, status),
    );
  }

  static int allocationSize(ValidationException value) {
    return 8;
  }

  static LiftRetVal<ValidationException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(ValidationException.lift(pointer), 8);
  }

  static int write(ValidationException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ValidationExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_validationerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_validationerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_validationerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class WellKnownExceptionInterface {
  ErrorCode code();
}

final _WellKnownExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_wellknownerror(ptr, status));
});

class WellKnownException implements WellKnownExceptionInterface {
  late final Pointer<Void> _ptr;

  WellKnownException._(this._ptr) {
    _WellKnownExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory WellKnownException.lift(Pointer<Void> ptr) {
    return WellKnownException._(ptr);
  }

  static Pointer<Void> lower(WellKnownException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_wellknownerror(_ptr, status),
    );
  }

  static int allocationSize(WellKnownException value) {
    return 8;
  }

  static LiftRetVal<WellKnownException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(WellKnownException.lift(pointer), 8);
  }

  static int write(WellKnownException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _WellKnownExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_wellknownerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_wellknownerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_wellknownerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  ErrorCode code() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_wellknownerror_code(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterErrorCode.lift,
      null,
    );
  }
}

abstract class BitcoindEnvInterface {
  BitcoindInstance getBitcoind();
  RpcClient getReceiver();
  RpcClient getSender();
}

final _BitcoindEnvFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_bitcoindenv(ptr, status));
});

class BitcoindEnv implements BitcoindEnvInterface {
  late final Pointer<Void> _ptr;

  BitcoindEnv._(this._ptr) {
    _BitcoindEnvFinalizer.attach(this, _ptr, detach: this);
  }

  factory BitcoindEnv.lift(Pointer<Void> ptr) {
    return BitcoindEnv._(ptr);
  }

  static Pointer<Void> lower(BitcoindEnv value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_bitcoindenv(_ptr, status),
    );
  }

  static int allocationSize(BitcoindEnv value) {
    return 8;
  }

  static LiftRetVal<BitcoindEnv> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(BitcoindEnv.lift(pointer), 8);
  }

  static int write(BitcoindEnv value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _BitcoindEnvFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_bitcoindenv(_ptr, status));
  }

  BitcoindInstance getBitcoind() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_bitcoindenv_get_bitcoind(
        uniffiClonePointer(),
        status,
      ),
      BitcoindInstance.lift,
      null,
    );
  }

  RpcClient getReceiver() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_bitcoindenv_get_receiver(
        uniffiClonePointer(),
        status,
      ),
      RpcClient.lift,
      null,
    );
  }

  RpcClient getSender() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_bitcoindenv_get_sender(
        uniffiClonePointer(),
        status,
      ),
      RpcClient.lift,
      null,
    );
  }
}

abstract class BitcoindInstanceInterface {}

final _BitcoindInstanceFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_bitcoindinstance(ptr, status),
  );
});

class BitcoindInstance implements BitcoindInstanceInterface {
  late final Pointer<Void> _ptr;

  BitcoindInstance._(this._ptr) {
    _BitcoindInstanceFinalizer.attach(this, _ptr, detach: this);
  }

  factory BitcoindInstance.lift(Pointer<Void> ptr) {
    return BitcoindInstance._(ptr);
  }

  static Pointer<Void> lower(BitcoindInstance value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_bitcoindinstance(_ptr, status),
    );
  }

  static int allocationSize(BitcoindInstance value) {
    return 8;
  }

  static LiftRetVal<BitcoindInstance> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(BitcoindInstance.lift(pointer), 8);
  }

  static int write(BitcoindInstance value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _BitcoindInstanceFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_bitcoindinstance(_ptr, status),
    );
  }
}

abstract class BoxSendSyncExceptionInterface {}

final _BoxSendSyncExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_payjoin_ffi_fn_free_boxsendsyncerror(ptr, status),
  );
});

class BoxSendSyncException implements BoxSendSyncExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  BoxSendSyncException._(this._ptr) {
    _BoxSendSyncExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory BoxSendSyncException.lift(Pointer<Void> ptr) {
    return BoxSendSyncException._(ptr);
  }

  static Pointer<Void> lower(BoxSendSyncException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_boxsendsyncerror(_ptr, status),
    );
  }

  static int allocationSize(BoxSendSyncException value) {
    return 8;
  }

  static LiftRetVal<BoxSendSyncException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(BoxSendSyncException.lift(pointer), 8);
  }

  static int write(BoxSendSyncException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _BoxSendSyncExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_boxsendsyncerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_boxsendsyncerror_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_boxsendsyncerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

class BoxSendSyncExceptionErrorHandler
    extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return BoxSendSyncException.read(errorBuf.asUint8List()).value;
  }
}

final BoxSendSyncExceptionErrorHandler boxSendSyncExceptionErrorHandler =
    BoxSendSyncExceptionErrorHandler();

abstract class JoinHandleInterface {}

final _JoinHandleFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_joinhandle(ptr, status));
});

class JoinHandle implements JoinHandleInterface {
  late final Pointer<Void> _ptr;

  JoinHandle._(this._ptr) {
    _JoinHandleFinalizer.attach(this, _ptr, detach: this);
  }

  factory JoinHandle.lift(Pointer<Void> ptr) {
    return JoinHandle._(ptr);
  }

  static Pointer<Void> lower(JoinHandle value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_joinhandle(_ptr, status),
    );
  }

  static int allocationSize(JoinHandle value) {
    return 8;
  }

  static LiftRetVal<JoinHandle> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(JoinHandle.lift(pointer), 8);
  }

  static int write(JoinHandle value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _JoinHandleFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_joinhandle(_ptr, status));
  }
}

abstract class RpcClientInterface {
  String call({required String method, required List<String?> params});
}

final _RpcClientFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_rpcclient(ptr, status));
});

class RpcClient implements RpcClientInterface {
  late final Pointer<Void> _ptr;

  RpcClient._(this._ptr) {
    _RpcClientFinalizer.attach(this, _ptr, detach: this);
  }

  factory RpcClient.lift(Pointer<Void> ptr) {
    return RpcClient._(ptr);
  }

  static Pointer<Void> lower(RpcClient value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_rpcclient(_ptr, status),
    );
  }

  static int allocationSize(RpcClient value) {
    return 8;
  }

  static LiftRetVal<RpcClient> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(RpcClient.lift(pointer), 8);
  }

  static int write(RpcClient value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _RpcClientFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_rpcclient(_ptr, status));
  }

  String call({required String method, required List<String?> params}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_rpcclient_call(
        uniffiClonePointer(),
        FfiConverterString.lower(method),
        FfiConverterSequenceOptionalString.lower(params),
        status,
      ),
      FfiConverterString.lift,
      ffiExceptionErrorHandler,
    );
  }
}

abstract class TestServicesInterface {
  Uint8List cert();
  String directoryUrl();
  OhttpKeys fetchOhttpKeys();
  String ohttpGatewayUrl();
  String ohttpRelayUrl();
  JoinHandle takeDirectoryHandle();
  JoinHandle takeOhttpRelayHandle();
  void waitForServicesReady();
}

final _TestServicesFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_testservices(ptr, status));
});

class TestServices implements TestServicesInterface {
  late final Pointer<Void> _ptr;

  TestServices._(this._ptr) {
    _TestServicesFinalizer.attach(this, _ptr, detach: this);
  }

  TestServices.initialize()
    : _ptr = rustCall(
        (status) =>
            uniffi_payjoin_ffi_fn_constructor_testservices_initialize(status),
        boxSendSyncExceptionErrorHandler,
      ) {
    _TestServicesFinalizer.attach(this, _ptr, detach: this);
  }

  factory TestServices.lift(Pointer<Void> ptr) {
    return TestServices._(ptr);
  }

  static Pointer<Void> lower(TestServices value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_testservices(_ptr, status),
    );
  }

  static int allocationSize(TestServices value) {
    return 8;
  }

  static LiftRetVal<TestServices> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(TestServices.lift(pointer), 8);
  }

  static int write(TestServices value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _TestServicesFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_testservices(_ptr, status));
  }

  Uint8List cert() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_testservices_cert(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterUint8List.lift,
      null,
    );
  }

  String directoryUrl() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_testservices_directory_url(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  OhttpKeys fetchOhttpKeys() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_testservices_fetch_ohttp_keys(
        uniffiClonePointer(),
        status,
      ),
      OhttpKeys.lift,
      boxSendSyncExceptionErrorHandler,
    );
  }

  String ohttpGatewayUrl() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_testservices_ohttp_gateway_url(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  String ohttpRelayUrl() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_testservices_ohttp_relay_url(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  JoinHandle takeDirectoryHandle() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_testservices_take_directory_handle(
            uniffiClonePointer(),
            status,
          ),
      JoinHandle.lift,
      null,
    );
  }

  JoinHandle takeOhttpRelayHandle() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_testservices_take_ohttp_relay_handle(
            uniffiClonePointer(),
            status,
          ),
      JoinHandle.lift,
      null,
    );
  }

  void waitForServicesReady() {
    return rustCall((status) {
      uniffi_payjoin_ffi_fn_method_testservices_wait_for_services_ready(
        uniffiClonePointer(),
        status,
      );
    }, boxSendSyncExceptionErrorHandler);
  }
}

abstract class PjUriInterface {
  String address();
  int? amountSats();
  String asString();
  String pjEndpoint();
  PjUri setAmountSats({required int amountSats});
}

final _PjUriFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_pjuri(ptr, status));
});

class PjUri implements PjUriInterface {
  late final Pointer<Void> _ptr;

  PjUri._(this._ptr) {
    _PjUriFinalizer.attach(this, _ptr, detach: this);
  }

  factory PjUri.lift(Pointer<Void> ptr) {
    return PjUri._(ptr);
  }

  static Pointer<Void> lower(PjUri value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_pjuri(_ptr, status),
    );
  }

  static int allocationSize(PjUri value) {
    return 8;
  }

  static LiftRetVal<PjUri> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PjUri.lift(pointer), 8);
  }

  static int write(PjUri value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PjUriFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_pjuri(_ptr, status));
  }

  String address() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjuri_address(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  int? amountSats() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjuri_amount_sats(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterOptionalUInt64.lift,
      null,
    );
  }

  String asString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjuri_as_string(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  String pjEndpoint() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjuri_pj_endpoint(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  PjUri setAmountSats({required int amountSats}) {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjuri_set_amount_sats(
        uniffiClonePointer(),
        FfiConverterUInt64.lower(amountSats),
        status,
      ),
      PjUri.lift,
      ffiValidationExceptionErrorHandler,
    );
  }
}

abstract class UriInterface {
  String address();
  int? amountSats();
  String asString();
  PjUri checkPjSupported();
  String? label();
  String? message();
}

final _UriFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_uri(ptr, status));
});

class Uri implements UriInterface {
  late final Pointer<Void> _ptr;

  Uri._(this._ptr) {
    _UriFinalizer.attach(this, _ptr, detach: this);
  }

  Uri.parse({required String uri})
    : _ptr = rustCall(
        (status) => uniffi_payjoin_ffi_fn_constructor_uri_parse(
          FfiConverterString.lower(uri),
          status,
        ),
        pjParseExceptionErrorHandler,
      ) {
    _UriFinalizer.attach(this, _ptr, detach: this);
  }

  factory Uri.lift(Pointer<Void> ptr) {
    return Uri._(ptr);
  }

  static Pointer<Void> lower(Uri value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall((status) => uniffi_payjoin_ffi_fn_clone_uri(_ptr, status));
  }

  static int allocationSize(Uri value) {
    return 8;
  }

  static LiftRetVal<Uri> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(Uri.lift(pointer), 8);
  }

  static int write(Uri value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _UriFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_uri(_ptr, status));
  }

  String address() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_uri_address(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  int? amountSats() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_uri_amount_sats(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterOptionalUInt64.lift,
      null,
    );
  }

  String asString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_uri_as_string(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  PjUri checkPjSupported() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_uri_check_pj_supported(
        uniffiClonePointer(),
        status,
      ),
      PjUri.lift,
      pjNotSupportedErrorHandler,
    );
  }

  String? label() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_uri_label(uniffiClonePointer(), status),
      FfiConverterOptionalString.lift,
      null,
    );
  }

  String? message() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_uri_message(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterOptionalString.lift,
      null,
    );
  }
}

abstract class UrlInterface {
  String asString();
  String? query();
}

final _UrlFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_url(ptr, status));
});

class Url implements UrlInterface {
  late final Pointer<Void> _ptr;

  Url._(this._ptr) {
    _UrlFinalizer.attach(this, _ptr, detach: this);
  }

  Url.parse({required String input})
    : _ptr = rustCall(
        (status) => uniffi_payjoin_ffi_fn_constructor_url_parse(
          FfiConverterString.lower(input),
          status,
        ),
        urlParseExceptionErrorHandler,
      ) {
    _UrlFinalizer.attach(this, _ptr, detach: this);
  }

  factory Url.lift(Pointer<Void> ptr) {
    return Url._(ptr);
  }

  static Pointer<Void> lower(Url value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall((status) => uniffi_payjoin_ffi_fn_clone_url(_ptr, status));
  }

  static int allocationSize(Url value) {
    return 8;
  }

  static LiftRetVal<Url> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(Url.lift(pointer), 8);
  }

  static int write(Url value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _UrlFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_url(_ptr, status));
  }

  String asString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_url_as_string(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  String? query() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_url_query(uniffiClonePointer(), status),
      FfiConverterOptionalString.lift,
      null,
    );
  }
}

abstract class FeeRateExceptionInterface {}

final _FeeRateExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_feerateerror(ptr, status));
});

class FeeRateException implements FeeRateExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  FeeRateException._(this._ptr) {
    _FeeRateExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory FeeRateException.lift(Pointer<Void> ptr) {
    return FeeRateException._(ptr);
  }

  static Pointer<Void> lower(FeeRateException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_feerateerror(_ptr, status),
    );
  }

  static int allocationSize(FeeRateException value) {
    return 8;
  }

  static LiftRetVal<FeeRateException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(FeeRateException.lift(pointer), 8);
  }

  static int write(FeeRateException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _FeeRateExceptionFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_feerateerror(_ptr, status));
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_feerateerror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_feerateerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

class FeeRateExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FeeRateException.read(errorBuf.asUint8List()).value;
  }
}

final FeeRateExceptionErrorHandler feeRateExceptionErrorHandler =
    FeeRateExceptionErrorHandler();

abstract class IntoUrlExceptionInterface {}

final _IntoUrlExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_intourlerror(ptr, status));
});

class IntoUrlException implements IntoUrlExceptionInterface {
  late final Pointer<Void> _ptr;

  IntoUrlException._(this._ptr) {
    _IntoUrlExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory IntoUrlException.lift(Pointer<Void> ptr) {
    return IntoUrlException._(ptr);
  }

  static Pointer<Void> lower(IntoUrlException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_intourlerror(_ptr, status),
    );
  }

  static int allocationSize(IntoUrlException value) {
    return 8;
  }

  static LiftRetVal<IntoUrlException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(IntoUrlException.lift(pointer), 8);
  }

  static int write(IntoUrlException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _IntoUrlExceptionFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_intourlerror(_ptr, status));
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_intourlerror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_intourlerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

abstract class PjNotSupportedInterface {}

final _PjNotSupportedFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_pjnotsupported(ptr, status));
});

class PjNotSupported implements PjNotSupportedInterface, Exception {
  late final Pointer<Void> _ptr;

  PjNotSupported._(this._ptr) {
    _PjNotSupportedFinalizer.attach(this, _ptr, detach: this);
  }

  factory PjNotSupported.lift(Pointer<Void> ptr) {
    return PjNotSupported._(ptr);
  }

  static Pointer<Void> lower(PjNotSupported value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_pjnotsupported(_ptr, status),
    );
  }

  static int allocationSize(PjNotSupported value) {
    return 8;
  }

  static LiftRetVal<PjNotSupported> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PjNotSupported.lift(pointer), 8);
  }

  static int write(PjNotSupported value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PjNotSupportedFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_pjnotsupported(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_debug(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! PjNotSupported) {
      return false;
    }
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_eq_eq(
            uniffiClonePointer(),
            PjNotSupported.lower(other),
            status,
          ),
      FfiConverterBool.lift,
      null,
    );
  }
}

class PjNotSupportedErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return PjNotSupported.read(errorBuf.asUint8List()).value;
  }
}

final PjNotSupportedErrorHandler pjNotSupportedErrorHandler =
    PjNotSupportedErrorHandler();

abstract class PjParseExceptionInterface {}

final _PjParseExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_pjparseerror(ptr, status));
});

class PjParseException implements PjParseExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  PjParseException._(this._ptr) {
    _PjParseExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory PjParseException.lift(Pointer<Void> ptr) {
    return PjParseException._(ptr);
  }

  static Pointer<Void> lower(PjParseException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_pjparseerror(_ptr, status),
    );
  }

  static int allocationSize(PjParseException value) {
    return 8;
  }

  static LiftRetVal<PjParseException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(PjParseException.lift(pointer), 8);
  }

  static int write(PjParseException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _PjParseExceptionFinalizer.detach(this);
    rustCall((status) => uniffi_payjoin_ffi_fn_free_pjparseerror(_ptr, status));
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! PjParseException) {
      return false;
    }
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_eq_eq(
        uniffiClonePointer(),
        PjParseException.lower(other),
        status,
      ),
      FfiConverterBool.lift,
      null,
    );
  }
}

class PjParseExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return PjParseException.read(errorBuf.asUint8List()).value;
  }
}

final PjParseExceptionErrorHandler pjParseExceptionErrorHandler =
    PjParseExceptionErrorHandler();

abstract class UrlParseExceptionInterface {}

final _UrlParseExceptionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_payjoin_ffi_fn_free_urlparseerror(ptr, status));
});

class UrlParseException implements UrlParseExceptionInterface, Exception {
  late final Pointer<Void> _ptr;

  UrlParseException._(this._ptr) {
    _UrlParseExceptionFinalizer.attach(this, _ptr, detach: this);
  }

  factory UrlParseException.lift(Pointer<Void> ptr) {
    return UrlParseException._(ptr);
  }

  static Pointer<Void> lower(UrlParseException value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_payjoin_ffi_fn_clone_urlparseerror(_ptr, status),
    );
  }

  static int allocationSize(UrlParseException value) {
    return 8;
  }

  static LiftRetVal<UrlParseException> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(UrlParseException.lift(pointer), 8);
  }

  static int write(UrlParseException value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _UrlParseExceptionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_payjoin_ffi_fn_free_urlparseerror(_ptr, status),
    );
  }

  String debugString() {
    return rustCallWithLifter(
      (status) => uniffi_payjoin_ffi_fn_method_urlparseerror_uniffi_trait_debug(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      null,
    );
  }

  @override
  String toString() {
    return rustCallWithLifter(
      (status) =>
          uniffi_payjoin_ffi_fn_method_urlparseerror_uniffi_trait_display(
            uniffiClonePointer(),
            status,
          ),
      FfiConverterString.lift,
      null,
    );
  }
}

class UrlParseExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return UrlParseException.read(errorBuf.asUint8List()).value;
  }
}

final UrlParseExceptionErrorHandler urlParseExceptionErrorHandler =
    UrlParseExceptionErrorHandler();

class UniffiInternalError implements Exception {
  static const int bufferOverflow = 0;
  static const int incompleteData = 1;
  static const int unexpectedOptionalTag = 2;
  static const int unexpectedEnumCase = 3;
  static const int unexpectedNullPointer = 4;
  static const int unexpectedRustCallStatusCode = 5;
  static const int unexpectedRustCallError = 6;
  static const int unexpectedStaleHandle = 7;
  static const int rustPanic = 8;

  final int errorCode;
  final String? panicMessage;

  const UniffiInternalError(this.errorCode, this.panicMessage);

  static UniffiInternalError panicked(String message) {
    return UniffiInternalError(rustPanic, message);
  }

  @override
  String toString() {
    switch (errorCode) {
      case bufferOverflow:
        return "UniFfi::BufferOverflow";
      case incompleteData:
        return "UniFfi::IncompleteData";
      case unexpectedOptionalTag:
        return "UniFfi::UnexpectedOptionalTag";
      case unexpectedEnumCase:
        return "UniFfi::UnexpectedEnumCase";
      case unexpectedNullPointer:
        return "UniFfi::UnexpectedNullPointer";
      case unexpectedRustCallStatusCode:
        return "UniFfi::UnexpectedRustCallStatusCode";
      case unexpectedRustCallError:
        return "UniFfi::UnexpectedRustCallError";
      case unexpectedStaleHandle:
        return "UniFfi::UnexpectedStaleHandle";
      case rustPanic:
        return "UniFfi::rustPanic: $panicMessage";
      default:
        return "UniFfi::UnknownError: $errorCode";
    }
  }
}

const int CALL_SUCCESS = 0;
const int CALL_ERROR = 1;
const int CALL_UNEXPECTED_ERROR = 2;

final class RustCallStatus extends Struct {
  @Int8()
  external int code;

  external RustBuffer errorBuf;
}

void checkCallStatus(
  UniffiRustCallStatusErrorHandler errorHandler,
  Pointer<RustCallStatus> status,
) {
  if (status.ref.code == CALL_SUCCESS) {
    return;
  } else if (status.ref.code == CALL_ERROR) {
    throw errorHandler.lift(status.ref.errorBuf);
  } else if (status.ref.code == CALL_UNEXPECTED_ERROR) {
    if (status.ref.errorBuf.len > 0) {
      throw UniffiInternalError.panicked(
        FfiConverterString.lift(status.ref.errorBuf),
      );
    } else {
      throw UniffiInternalError.panicked("Rust panic");
    }
  } else {
    throw UniffiInternalError.panicked(
      "Unexpected RustCallStatus code: \${status.ref.code}",
    );
  }
}

T rustCall<T>(
  T Function(Pointer<RustCallStatus>) callback, [
  UniffiRustCallStatusErrorHandler? errorHandler,
]) {
  final status = calloc<RustCallStatus>();
  try {
    final result = callback(status);
    checkCallStatus(errorHandler ?? NullRustCallStatusErrorHandler(), status);
    return result;
  } finally {
    calloc.free(status);
  }
}

T rustCallWithLifter<T, F>(
  F Function(Pointer<RustCallStatus>) ffiCall,
  T Function(F) lifter, [
  UniffiRustCallStatusErrorHandler? errorHandler,
]) {
  final status = calloc<RustCallStatus>();
  try {
    final rawResult = ffiCall(status);
    checkCallStatus(errorHandler ?? NullRustCallStatusErrorHandler(), status);
    return lifter(rawResult);
  } finally {
    calloc.free(status);
  }
}

class NullRustCallStatusErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    errorBuf.free();
    return UniffiInternalError.panicked("Unexpected CALL_ERROR");
  }
}

abstract class UniffiRustCallStatusErrorHandler {
  Exception lift(RustBuffer errorBuf);
}

final class RustBuffer extends Struct {
  @Uint64()
  external int capacity;

  @Uint64()
  external int len;

  external Pointer<Uint8> data;

  static RustBuffer alloc(int size) {
    return rustCall((status) => ffi_payjoin_ffi_rustbuffer_alloc(size, status));
  }

  static RustBuffer fromBytes(ForeignBytes bytes) {
    return rustCall(
      (status) => ffi_payjoin_ffi_rustbuffer_from_bytes(bytes, status),
    );
  }

  void free() {
    rustCall((status) => ffi_payjoin_ffi_rustbuffer_free(this, status));
  }

  RustBuffer reserve(int additionalCapacity) {
    return rustCall(
      (status) =>
          ffi_payjoin_ffi_rustbuffer_reserve(this, additionalCapacity, status),
    );
  }

  Uint8List asUint8List() {
    final dataList = data.asTypedList(len);
    final byteData = ByteData.sublistView(dataList);
    return Uint8List.view(byteData.buffer);
  }

  @override
  String toString() {
    return "RustBuffer{capacity: \$capacity, len: \$len, data: \$data}";
  }
}

RustBuffer toRustBuffer(Uint8List data) {
  final length = data.length;

  final Pointer<Uint8> frameData = calloc<Uint8>(length);
  final pointerList = frameData.asTypedList(length);
  pointerList.setAll(0, data);

  final bytes = calloc<ForeignBytes>();
  bytes.ref.len = length;
  bytes.ref.data = frameData;
  return RustBuffer.fromBytes(bytes.ref);
}

final class ForeignBytes extends Struct {
  @Int32()
  external int len;
  external Pointer<Uint8> data;

  void free() {
    calloc.free(data);
  }
}

class LiftRetVal<T> {
  final T value;
  final int bytesRead;
  const LiftRetVal(this.value, this.bytesRead);

  LiftRetVal<T> copyWithOffset(int offset) {
    return LiftRetVal(value, bytesRead + offset);
  }
}

abstract class FfiConverter<D, F> {
  const FfiConverter();

  D lift(F value);
  F lower(D value);
  D read(ByteData buffer, int offset);
  void write(D value, ByteData buffer, int offset);
  int size(D value);
}

mixin FfiConverterPrimitive<T> on FfiConverter<T, T> {
  @override
  T lift(T value) => value;

  @override
  T lower(T value) => value;
}

Uint8List createUint8ListFromInt(int value) {
  int length = value.bitLength ~/ 8 + 1;

  if (length != 4 && length != 8) {
    length = (value < 0x100000000) ? 4 : 8;
  }

  Uint8List uint8List = Uint8List(length);

  for (int i = length - 1; i >= 0; i--) {
    uint8List[i] = value & 0xFF;
    value >>= 8;
  }

  return uint8List;
}

class FfiConverterBool {
  static bool lift(int value) {
    return value == 1;
  }

  static int lower(bool value) {
    return value ? 1 : 0;
  }

  static LiftRetVal<bool> read(Uint8List buf) {
    return LiftRetVal(FfiConverterBool.lift(buf.first), 1);
  }

  static RustBuffer lowerIntoRustBuffer(bool value) {
    return toRustBuffer(Uint8List.fromList([FfiConverterBool.lower(value)]));
  }

  static int allocationSize([bool value = false]) {
    return 1;
  }

  static int write(bool value, Uint8List buf) {
    buf.setAll(0, [value ? 1 : 0]);
    return allocationSize();
  }
}

class FfiConverterOptionalReceiverPendingFallback {
  static ReceiverPendingFallback? lift(RustBuffer buf) {
    return FfiConverterOptionalReceiverPendingFallback.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<ReceiverPendingFallback?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = ReceiverPendingFallback.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<ReceiverPendingFallback?>(
      result.value,
      result.bytesRead + 1,
    );
  }

  static int allocationSize([ReceiverPendingFallback? value]) {
    if (value == null) {
      return 1;
    }
    return ReceiverPendingFallback.allocationSize(value) + 1;
  }

  static RustBuffer lower(ReceiverPendingFallback? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalReceiverPendingFallback.allocationSize(
      value,
    );

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalReceiverPendingFallback.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(ReceiverPendingFallback? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return ReceiverPendingFallback.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalString {
  static String? lift(RustBuffer buf) {
    return FfiConverterOptionalString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<String?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterString.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<String?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([String? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterString.allocationSize(value) + 1;
  }

  static RustBuffer lower(String? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalString.allocationSize(value);

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalString.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(String? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return FfiConverterString.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalTxOut {
  static TxOut? lift(RustBuffer buf) {
    return FfiConverterOptionalTxOut.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TxOut?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterTxOut.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<TxOut?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([TxOut? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterTxOut.allocationSize(value) + 1;
  }

  static RustBuffer lower(TxOut? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalTxOut.allocationSize(value);

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalTxOut.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(TxOut? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return FfiConverterTxOut.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalUInt64 {
  static int? lift(RustBuffer buf) {
    return FfiConverterOptionalUInt64.read(buf.asUint8List()).value;
  }

  static LiftRetVal<int?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<int?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([int? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterUInt64.allocationSize(value) + 1;
  }

  static RustBuffer lower(int? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalUInt64.allocationSize(value);

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalUInt64.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(int? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return FfiConverterUInt64.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalUInt8 {
  static int? lift(RustBuffer buf) {
    return FfiConverterOptionalUInt8.read(buf.asUint8List()).value;
  }

  static LiftRetVal<int?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterUInt8.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<int?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([int? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterUInt8.allocationSize(value) + 1;
  }

  static RustBuffer lower(int? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalUInt8.allocationSize(value);

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalUInt8.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(int? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return FfiConverterUInt8.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalUint8List {
  static Uint8List? lift(RustBuffer buf) {
    return FfiConverterOptionalUint8List.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Uint8List?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterUint8List.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Uint8List?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Uint8List? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterUint8List.allocationSize(value) + 1;
  }

  static RustBuffer lower(Uint8List? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalUint8List.allocationSize(value);

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalUint8List.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Uint8List? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return FfiConverterUint8List.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalWeight {
  static Weight? lift(RustBuffer buf) {
    return FfiConverterOptionalWeight.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Weight?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterWeight.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Weight?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Weight? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterWeight.allocationSize(value) + 1;
  }

  static RustBuffer lower(Weight? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }

    final length = FfiConverterOptionalWeight.allocationSize(value);

    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);

    FfiConverterOptionalWeight.write(value, buf);

    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Weight? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }

    buf[0] = 1;

    return FfiConverterWeight.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterSequenceInputPair {
  static List<InputPair> lift(RustBuffer buf) {
    return FfiConverterSequenceInputPair.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<InputPair>> read(Uint8List buf) {
    List<InputPair> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = InputPair.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<InputPair> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += InputPair.write(value[i], Uint8List.view(buf.buffer, offset));
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<InputPair> value) {
    return value
            .map((l) => InputPair.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<InputPair> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceOptionalString {
  static List<String?> lift(RustBuffer buf) {
    return FfiConverterSequenceOptionalString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<String?>> read(Uint8List buf) {
    List<String?> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterOptionalString.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<String?> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterOptionalString.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<String?> value) {
    return value
            .map((l) => FfiConverterOptionalString.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<String?> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceString {
  static List<String> lift(RustBuffer buf) {
    return FfiConverterSequenceString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<String>> read(Uint8List buf) {
    List<String> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<String> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterString.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<String> value) {
    return value
            .map((l) => FfiConverterString.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<String> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceTxOut {
  static List<TxOut> lift(RustBuffer buf) {
    return FfiConverterSequenceTxOut.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<TxOut>> read(Uint8List buf) {
    List<TxOut> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterTxOut.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<TxOut> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterTxOut.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<TxOut> value) {
    return value
            .map((l) => FfiConverterTxOut.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<TxOut> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceUint8List {
  static List<Uint8List> lift(RustBuffer buf) {
    return FfiConverterSequenceUint8List.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Uint8List>> read(Uint8List buf) {
    List<Uint8List> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterUint8List.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Uint8List> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterUint8List.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Uint8List> value) {
    return value
            .map((l) => FfiConverterUint8List.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Uint8List> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterString {
  static String lift(RustBuffer buf) {
    return utf8.decoder.convert(buf.asUint8List());
  }

  static RustBuffer lower(String value) {
    return toRustBuffer(Utf8Encoder().convert(value));
  }

  static LiftRetVal<String> read(Uint8List buf) {
    final end = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0) + 4;
    return LiftRetVal(utf8.decoder.convert(buf, 4, end), end);
  }

  static int allocationSize([String value = ""]) {
    return utf8.encoder.convert(value).length + 4;
  }

  static int write(String value, Uint8List buf) {
    final list = utf8.encoder.convert(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, list.length);
    buf.setAll(4, list);
    return list.length + 4;
  }
}

class FfiConverterUInt32 {
  static int lift(int value) => value;

  static LiftRetVal<int> read(Uint8List buf) {
    return LiftRetVal(buf.buffer.asByteData(buf.offsetInBytes).getUint32(0), 4);
  }

  static int lower(int value) {
    if (value < 0 || value > 4294967295) {
      throw ArgumentError("Value out of range for u32: " + value.toString());
    }
    return value;
  }

  static int allocationSize([int value = 0]) {
    return 4;
  }

  static int write(int value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setUint32(0, lower(value));
    return 4;
  }
}

class FfiConverterUInt64 {
  static int lift(int value) => value;

  static LiftRetVal<int> read(Uint8List buf) {
    return LiftRetVal(buf.buffer.asByteData(buf.offsetInBytes).getUint64(0), 8);
  }

  static int lower(int value) {
    if (value < 0) {
      throw ArgumentError("Value out of range for u64: " + value.toString());
    }
    return value;
  }

  static int allocationSize([int value = 0]) {
    return 8;
  }

  static int write(int value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setUint64(0, lower(value));
    return 8;
  }
}

class FfiConverterUInt8 {
  static int lift(int value) => value;

  static LiftRetVal<int> read(Uint8List buf) {
    return LiftRetVal(buf.buffer.asByteData(buf.offsetInBytes).getUint8(0), 1);
  }

  static int lower(int value) {
    if (value < 0 || value > 255) {
      throw ArgumentError("Value out of range for u8: " + value.toString());
    }
    return value;
  }

  static int allocationSize([int value = 0]) {
    return 1;
  }

  static int write(int value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setUint8(0, lower(value));
    return 1;
  }
}

class FfiConverterUint8List {
  static Uint8List lift(RustBuffer value) {
    return FfiConverterUint8List.read(value.asUint8List()).value;
  }

  static LiftRetVal<Uint8List> read(Uint8List buf) {
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final bytes = Uint8List.view(buf.buffer, buf.offsetInBytes + 4, length);
    return LiftRetVal(bytes, length + 4);
  }

  static RustBuffer lower(Uint8List value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int allocationSize([Uint8List? value]) {
    if (value == null) {
      return 4;
    }
    return 4 + value.length;
  }

  static int write(Uint8List value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    buf.setRange(4, 4 + value.length, value);
    return 4 + value.length;
  }
}

const int UNIFFI_RUST_FUTURE_POLL_READY = 0;
const int UNIFFI_RUST_FUTURE_POLL_MAYBE_READY = 1;

typedef UniffiRustFutureContinuationCallback = Void Function(Uint64, Int8);

final _uniffiRustFutureContinuationHandles = UniffiHandleMap<Completer<int>>();

Future<T> uniffiRustCallAsync<T, F>(
  Pointer<Void> Function() rustFutureFunc,
  void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
  pollFunc,
  F Function(Pointer<Void>, Pointer<RustCallStatus>) completeFunc,
  void Function(Pointer<Void>) freeFunc,
  T Function(F) liftFunc, [
  UniffiRustCallStatusErrorHandler? errorHandler,
]) async {
  final rustFuture = rustFutureFunc();
  final completer = Completer<int>();
  final handle = _uniffiRustFutureContinuationHandles.insert(completer);
  final callbackData = Pointer<Void>.fromAddress(handle);

  late final NativeCallable<UniffiRustFutureContinuationCallback> callback;

  void repoll() {
    pollFunc(rustFuture, callback.nativeFunction, callbackData);
  }

  void onResponse(int data, int pollResult) {
    if (pollResult == UNIFFI_RUST_FUTURE_POLL_READY) {
      final readyCompleter = _uniffiRustFutureContinuationHandles.maybeRemove(
        data,
      );
      if (readyCompleter != null && !readyCompleter.isCompleted) {
        readyCompleter.complete(pollResult);
      }
    } else if (pollResult == UNIFFI_RUST_FUTURE_POLL_MAYBE_READY) {
      repoll();
    } else {
      final errorCompleter = _uniffiRustFutureContinuationHandles.maybeRemove(
        data,
      );
      if (errorCompleter != null && !errorCompleter.isCompleted) {
        errorCompleter.completeError(
          UniffiInternalError.panicked(
            "Unexpected poll result from Rust future: \$pollResult",
          ),
        );
      }
    }
  }

  callback = NativeCallable<UniffiRustFutureContinuationCallback>.listener(
    onResponse,
  );

  try {
    repoll();
    await completer.future;

    final status = calloc<RustCallStatus>();
    try {
      final result = completeFunc(rustFuture, status);
      checkCallStatus(errorHandler ?? NullRustCallStatusErrorHandler(), status);
      return liftFunc(result);
    } finally {
      calloc.free(status);
    }
  } finally {
    callback.close();
    _uniffiRustFutureContinuationHandles.maybeRemove(handle);
    freeFunc(rustFuture);
  }
}

typedef UniffiForeignFutureFree = Void Function(Uint64);
typedef UniffiForeignFutureFreeDart = void Function(int);

class _UniffiForeignFutureState {
  bool cancelled = false;
}

final _uniffiForeignFutureHandleMap =
    UniffiHandleMap<_UniffiForeignFutureState>();

void _uniffiForeignFutureFree(int handle) {
  final state = _uniffiForeignFutureHandleMap.maybeRemove(handle);
  if (state != null) {
    state.cancelled = true;
  }
}

final Pointer<NativeFunction<UniffiForeignFutureFree>>
_uniffiForeignFutureFreePointer = Pointer.fromFunction<UniffiForeignFutureFree>(
  _uniffiForeignFutureFree,
);

final class UniffiForeignFuture extends Struct {
  @Uint64()
  external int handle;

  external Pointer<NativeFunction<UniffiForeignFutureFree>> free;
}

class UniffiHandleMap<T> {
  final Map<int, T> _map = {};
  int _counter = 1;

  int insert(T obj) {
    final handle = _counter;
    _counter += 2;
    _map[handle] = obj;
    return handle;
  }

  T get(int handle) {
    final obj = _map[handle];
    if (obj == null) {
      throw UniffiInternalError(
        UniffiInternalError.unexpectedStaleHandle,
        "Handle not found",
      );
    }
    return obj;
  }

  T remove(int handle) {
    final obj = maybeRemove(handle);
    if (obj == null) {
      throw UniffiInternalError(
        UniffiInternalError.unexpectedStaleHandle,
        "Handle not found",
      );
    }
    return obj;
  }

  T? maybeRemove(int handle) {
    return _map.remove(handle);
  }
}

const _uniffiAssetId = "package:payjoin/uniffi:payjoin_ffi";

ReplayResult replayReceiverEventLog({
  required JsonReceiverSessionPersister persister,
}) {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_replay_receiver_event_log(
      FfiConverterCallbackInterfaceJsonReceiverSessionPersister.lower(
        persister,
      ),
      status,
    ),
    ReplayResult.lift,
    receiverReplayExceptionErrorHandler,
  );
}

Future<ReplayResult> replayReceiverEventLogAsync({
  required JsonReceiverSessionPersisterAsync persister,
}) {
  return uniffiRustCallAsync(
    () => uniffi_payjoin_ffi_fn_func_replay_receiver_event_log_async(
      FfiConverterCallbackInterfaceJsonReceiverSessionPersisterAsync.lower(
        persister,
      ),
    ),
    ffi_payjoin_ffi_rust_future_poll_u64,
    ffi_payjoin_ffi_rust_future_complete_u64,
    ffi_payjoin_ffi_rust_future_free_u64,
    (ptr) => ReplayResult.lift(Pointer<Void>.fromAddress(ptr)),
    receiverReplayExceptionErrorHandler,
  );
}

SenderReplayResult replaySenderEventLog({
  required JsonSenderSessionPersister persister,
}) {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_replay_sender_event_log(
      FfiConverterCallbackInterfaceJsonSenderSessionPersister.lower(persister),
      status,
    ),
    SenderReplayResult.lift,
    senderReplayExceptionErrorHandler,
  );
}

Future<SenderReplayResult> replaySenderEventLogAsync({
  required JsonSenderSessionPersisterAsync persister,
}) {
  return uniffiRustCallAsync(
    () => uniffi_payjoin_ffi_fn_func_replay_sender_event_log_async(
      FfiConverterCallbackInterfaceJsonSenderSessionPersisterAsync.lower(
        persister,
      ),
    ),
    ffi_payjoin_ffi_rust_future_poll_u64,
    ffi_payjoin_ffi_rust_future_complete_u64,
    ffi_payjoin_ffi_rust_future_free_u64,
    (ptr) => SenderReplayResult.lift(Pointer<Void>.fromAddress(ptr)),
    senderReplayExceptionErrorHandler,
  );
}

String exampleUrl() {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_example_url(status),
    FfiConverterString.lift,
    null,
  );
}

BitcoindEnv initBitcoindSenderReceiver() {
  return rustCallWithLifter(
    (status) =>
        uniffi_payjoin_ffi_fn_func_init_bitcoind_sender_receiver(status),
    BitcoindEnv.lift,
    ffiExceptionErrorHandler,
  );
}

void initTracing() {
  return rustCall((status) {
    uniffi_payjoin_ffi_fn_func_init_tracing(status);
  }, null);
}

String invalidPsbt() {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_invalid_psbt(status),
    FfiConverterString.lift,
    null,
  );
}

String originalPsbt() {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_original_psbt(status),
    FfiConverterString.lift,
    null,
  );
}

String payjoinProposal() {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_payjoin_proposal(status),
    FfiConverterString.lift,
    null,
  );
}

String payjoinProposalWithSenderInfo() {
  return rustCallWithLifter(
    (status) =>
        uniffi_payjoin_ffi_fn_func_payjoin_proposal_with_sender_info(status),
    FfiConverterString.lift,
    null,
  );
}

String queryParams() {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_query_params(status),
    FfiConverterString.lift,
    null,
  );
}

String receiverInputContribution() {
  return rustCallWithLifter(
    (status) => uniffi_payjoin_ffi_fn_func_receiver_input_contribution(status),
    FfiConverterString.lift,
    null,
  );
}

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_implementationerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_implementationerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_implementationerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_implementationerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_serdejsonerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_serdejsonerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_serdejsonerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_serdejsonerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_clientresponse(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_clientresponse(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_ohttpkeys(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_ohttpkeys(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_constructor_ohttpkeys_decode(
  RustBuffer bytes,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_ohttperror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_ohttperror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_ohttperror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_ohttperror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_assumeinteractivetransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_assumeinteractivetransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_assumeinteractivetransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_assumeinteractivetransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_canbroadcast(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_canbroadcast(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<UniffiVTableCallbackInterfaceCanBroadcast>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_init_callback_vtable_canbroadcast(
  Pointer<UniffiVTableCallbackInterfaceCanBroadcast> vtable,
);

@Native<Int8 Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_canbroadcast_callback(
  Pointer<Void> ptr,
  RustBuffer tx,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_canceltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_canceltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_method_canceltransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_canceltransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_hasreplyableerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_hasreplyableerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_hasreplyableerror_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_hasreplyableerror_create_error_request(
  Pointer<Void> ptr,
  RustBuffer ohttp_relay,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_hasreplyableerror_process_error_response(
  Pointer<Void> ptr,
  RustBuffer body,
  Pointer<Void> ohttp_context,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_hasreplyableerrortransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_hasreplyableerrortransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_hasreplyableerrortransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_hasreplyableerrortransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_initialreceivetransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_initialreceivetransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_initialreceivetransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_initialreceivetransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_initialized(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_initialized(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_initialized_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_initialized_create_poll_request(
  Pointer<Void> ptr,
  RustBuffer ohttp_relay,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_initialized_pj_uri(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_initialized_process_response(
  Pointer<Void> ptr,
  RustBuffer body,
  Pointer<Void> ctx,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_initializedtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_initializedtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_method_initializedtransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_initializedtransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_inputpair(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_inputpair(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_constructor_inputpair_new(
  RustBuffer txin,
  RustBuffer psbtin,
  RustBuffer expected_weight,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_inputpair_outpoint(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_isoutputknown(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_isoutputknown(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<UniffiVTableCallbackInterfaceIsOutputKnown>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_init_callback_vtable_isoutputknown(
  Pointer<UniffiVTableCallbackInterfaceIsOutputKnown> vtable,
);

@Native<Int8 Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_isoutputknown_callback(
  Pointer<Void> ptr,
  RustBuffer outpoint,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_isscriptowned(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_isscriptowned(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<UniffiVTableCallbackInterfaceIsScriptOwned>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_init_callback_vtable_isscriptowned(
  Pointer<UniffiVTableCallbackInterfaceIsScriptOwned> vtable,
);

@Native<Int8 Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_isscriptowned_callback(
  Pointer<Void> ptr,
  RustBuffer script,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_jsonreceiversessionpersister(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_jsonreceiversessionpersister(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<UniffiVTableCallbackInterfaceJsonReceiverSessionPersister>,
  )
>(assetId: _uniffiAssetId)
external void
uniffi_payjoin_ffi_fn_init_callback_vtable_jsonreceiversessionpersister(
  Pointer<UniffiVTableCallbackInterfaceJsonReceiverSessionPersister> vtable,
);

@Native<Void Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersister_save(
  Pointer<Void> ptr,
  RustBuffer event,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersister_load(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersister_close(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_clone_jsonreceiversessionpersisterasync(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_jsonreceiversessionpersisterasync(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<UniffiVTableCallbackInterfaceJsonReceiverSessionPersisterAsync>,
  )
>(assetId: _uniffiAssetId)
external void
uniffi_payjoin_ffi_fn_init_callback_vtable_jsonreceiversessionpersisterasync(
  Pointer<UniffiVTableCallbackInterfaceJsonReceiverSessionPersisterAsync>
  vtable,
);

@Native<Pointer<Void> Function(Pointer<Void>, RustBuffer)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersisterasync_save(
  Pointer<Void> ptr,
  RustBuffer event,
);

@Native<Pointer<Void> Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersisterasync_load(
  Pointer<Void> ptr,
);

@Native<Pointer<Void> Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_jsonreceiversessionpersisterasync_close(
  Pointer<Void> ptr,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_maybeinputsowned(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_maybeinputsowned(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_maybeinputsowned_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_maybeinputsowned_check_inputs_not_owned(
  Pointer<Void> ptr,
  Pointer<Void> is_owned,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_maybeinputsowned_extract_tx_to_schedule_broadcast(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_maybeinputsownedtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_maybeinputsownedtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_maybeinputsownedtransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_maybeinputsownedtransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_maybeinputsseen(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_maybeinputsseen(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_maybeinputsseen_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_maybeinputsseen_check_no_inputs_seen_before(
  Pointer<Void> ptr,
  Pointer<Void> is_known,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_maybeinputsseentransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_maybeinputsseentransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_maybeinputsseentransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_maybeinputsseentransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_monitor(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_monitor(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_monitor_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_monitor_check_for_transaction(
  Pointer<Void> ptr,
  Pointer<Void> find_transaction,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_monitortransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_monitortransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_monitortransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_monitortransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_outputsunknown(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_outputsunknown(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_outputsunknown_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_outputsunknown_identify_receiver_outputs(
  Pointer<Void> ptr,
  Pointer<Void> is_receiver_output,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_outputsunknowntransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_outputsunknowntransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_outputsunknowntransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_outputsunknowntransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_payjoinproposal(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_payjoinproposal(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_payjoinproposal_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_payjoinproposal_create_post_request(
  Pointer<Void> ptr,
  RustBuffer ohttp_relay,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_payjoinproposal_process_response(
  Pointer<Void> ptr,
  RustBuffer body,
  Pointer<Void> ohttp_context,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_payjoinproposal_psbt(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_payjoinproposaltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_payjoinproposaltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_payjoinproposaltransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_payjoinproposaltransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pendingfallbacktransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pendingfallbacktransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_pendingfallbacktransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_pendingfallbacktransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_processpsbt(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_processpsbt(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<UniffiVTableCallbackInterfaceProcessPsbt>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_init_callback_vtable_processpsbt(
  Pointer<UniffiVTableCallbackInterfaceProcessPsbt> vtable,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_method_processpsbt_callback(
  Pointer<Void> ptr,
  RustBuffer psbt,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_provisionalproposal(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_provisionalproposal(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_provisionalproposal_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_provisionalproposal_finalize_proposal(
  Pointer<Void> ptr,
  Pointer<Void> process_psbt,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_provisionalproposal_psbt_to_sign(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_clone_provisionalproposaltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_provisionalproposaltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_provisionalproposaltransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_provisionalproposaltransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiverbuilder(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiverbuilder(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_constructor_receiverbuilder_new(
  RustBuffer address,
  RustBuffer directory,
  Pointer<Void> ohttp_keys,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_receiverbuilder_build(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_receiverbuilder_with_amount(
  Pointer<Void> ptr,
  int amount_sats,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_receiverbuilder_with_expiration(
  Pointer<Void> ptr,
  int expiration_secs,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_receiverbuilder_with_max_fee_rate(
  Pointer<Void> ptr,
  int max_effective_fee_rate_sat_per_vb,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiverpendingfallback(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiverpendingfallback(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_receiverpendingfallback_close(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_receiverpendingfallback_fallback_tx(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiversessionevent(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiversessionevent(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_constructor_receiversessionevent_from_json(
  RustBuffer json,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_receiversessionevent_to_json(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiversessionhistory(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiversessionhistory(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_receiversessionhistory_fallback_tx(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_receiversessionhistory_pj_uri(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_receiversessionhistory_status(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiversessionoutcome(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiversessionoutcome(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiversessionstatus(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiversessionstatus(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_replayresult(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_replayresult(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_replayresult_session_history(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_replayresult_state(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_transactionfinder(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_transactionfinder(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<UniffiVTableCallbackInterfaceTransactionFinder>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_init_callback_vtable_transactionfinder(
  Pointer<UniffiVTableCallbackInterfaceTransactionFinder> vtable,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_method_transactionfinder_callback(
  Pointer<Void> ptr,
  RustBuffer txid,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_uncheckedoriginalpayload(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_uncheckedoriginalpayload(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayload_assume_interactive_receiver(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayload_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayload_check_broadcast_suitability(
  Pointer<Void> ptr,
  RustBuffer min_fee_rate_sat_per_kwu,
  Pointer<Void> can_broadcast,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_clone_uncheckedoriginalpayloadtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_uncheckedoriginalpayloadtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayloadtransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_uncheckedoriginalpayloadtransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wantsfeerange(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wantsfeerange(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsfeerange_apply_fee_range(
  Pointer<Void> ptr,
  RustBuffer min_fee_rate_sat_per_vb,
  RustBuffer max_effective_fee_rate_sat_per_vb,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsfeerange_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wantsfeerangetransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wantsfeerangetransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsfeerangetransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsfeerangetransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wantsinputs(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wantsinputs(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsinputs_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsinputs_commit_inputs(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsinputs_contribute_inputs(
  Pointer<Void> ptr,
  RustBuffer replacement_inputs,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsinputs_try_preserving_privacy(
  Pointer<Void> ptr,
  RustBuffer candidate_inputs,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wantsinputstransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wantsinputstransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsinputstransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsinputstransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wantsoutputs(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wantsoutputs(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsoutputs_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsoutputs_commit_outputs(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_wantsoutputs_output_substitution(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsoutputs_replace_receiver_outputs(
  Pointer<Void> ptr,
  RustBuffer replacement_outputs,
  RustBuffer drain_script_pubkey,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsoutputs_substitute_receiver_script(
  Pointer<Void> ptr,
  RustBuffer output_script_pubkey,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wantsoutputstransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wantsoutputstransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_wantsoutputstransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_wantsoutputstransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_addressparseerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_addressparseerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_addressparseerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_addressparseerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_coinselectionerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_coinselectionerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_coinselectionerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_coinselectionerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_inputcontributionerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_inputcontributionerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_inputcontributionerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_inputcontributionerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_jsonreply(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_jsonreply(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_jsonreply_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_jsonreply_uniffi_trait_eq_eq(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_jsonreply_uniffi_trait_eq_ne(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_clone_outputsubstitutionprotocolerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_outputsubstitutionprotocolerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_outputsubstitutionprotocolerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_outputsubstitutionprotocolerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_protocolerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_protocolerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_protocolerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_protocolerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_psbtinputerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_psbtinputerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_psbtinputerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_psbtinputerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receivercreaterequesterror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receivercreaterequesterror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_receivercreaterequesterror_is_expired(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_receivercreaterequesterror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_receivercreaterequesterror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_receiverreplayerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_receiverreplayerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_receiverreplayerror_is_expired(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_receiverreplayerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_receiverreplayerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_sessionerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_sessionerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_sessionerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_sessionerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_broadcastedtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_broadcastedtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_broadcastedtransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_broadcastedtransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_initialsendtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_initialsendtransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_initialsendtransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_initialsendtransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_jsonsendersessionpersister(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_jsonsendersessionpersister(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<UniffiVTableCallbackInterfaceJsonSenderSessionPersister>,
  )
>(assetId: _uniffiAssetId)
external void
uniffi_payjoin_ffi_fn_init_callback_vtable_jsonsendersessionpersister(
  Pointer<UniffiVTableCallbackInterfaceJsonSenderSessionPersister> vtable,
);

@Native<Void Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_jsonsendersessionpersister_save(
  Pointer<Void> ptr,
  RustBuffer event,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_jsonsendersessionpersister_load(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_jsonsendersessionpersister_close(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_clone_jsonsendersessionpersisterasync(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_jsonsendersessionpersisterasync(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<UniffiVTableCallbackInterfaceJsonSenderSessionPersisterAsync>,
  )
>(assetId: _uniffiAssetId)
external void
uniffi_payjoin_ffi_fn_init_callback_vtable_jsonsendersessionpersisterasync(
  Pointer<UniffiVTableCallbackInterfaceJsonSenderSessionPersisterAsync> vtable,
);

@Native<Pointer<Void> Function(Pointer<Void>, RustBuffer)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_jsonsendersessionpersisterasync_save(
  Pointer<Void> ptr,
  RustBuffer event,
);

@Native<Pointer<Void> Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_jsonsendersessionpersisterasync_load(
  Pointer<Void> ptr,
);

@Native<Pointer<Void> Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_jsonsendersessionpersisterasync_close(
  Pointer<Void> ptr,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pjparam(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pjparam(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pollingforproposal(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pollingforproposal(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_pollingforproposal_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_pollingforproposal_create_poll_request(
  Pointer<Void> ptr,
  RustBuffer ohttp_relay,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_pollingforproposal_process_response(
  Pointer<Void> ptr,
  RustBuffer response,
  Pointer<Void> ohttp_ctx,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pollingforproposaltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pollingforproposaltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_pollingforproposaltransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_pollingforproposaltransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_senderbuilder(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_senderbuilder(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_constructor_senderbuilder_new(
  RustBuffer psbt,
  Pointer<Void> uri,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_senderbuilder_always_disable_output_substitution(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_senderbuilder_build_non_incentivizing(
  Pointer<Void> ptr,
  int min_fee_rate_sat_per_kwu,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_senderbuilder_build_recommended(
  Pointer<Void> ptr,
  int min_fee_rate_sat_per_kwu,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    Uint64,
    RustBuffer,
    Uint64,
    Int8,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_senderbuilder_build_with_additional_fee(
  Pointer<Void> ptr,
  int max_fee_contribution_sats,
  RustBuffer change_index,
  int min_fee_rate_sat_per_kwu,
  int clamp_fee_contribution,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_sendercanceltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_sendercanceltransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_sendercanceltransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_sendercanceltransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_senderpendingfallback(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_senderpendingfallback(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_senderpendingfallback_close(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_senderpendingfallback_fallback_tx(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_senderreplayresult(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_senderreplayresult(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_senderreplayresult_session_history(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_senderreplayresult_state(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_sendersessionevent(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_sendersessionevent(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_constructor_sendersessionevent_from_json(
  RustBuffer json,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_sendersessionevent_to_json(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_sendersessionhistory(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_sendersessionhistory(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_sendersessionhistory_fallback_tx(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_sendersessionhistory_pj_param(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_sendersessionhistory_status(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_sendersessionoutcome(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_sendersessionoutcome(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_sendersessionoutcome_is_aborted(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_sendersessionoutcome_is_success(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_sendersessionoutcome_success_psbt_base64(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_sendersessionstatus(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_sendersessionstatus(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_v1context(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_v1context(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_method_v1context_process_response(
  Pointer<Void> ptr,
  RustBuffer response,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_withreplykey(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_withreplykey(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_withreplykey_cancel(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_method_withreplykey_create_v2_post_request(
  Pointer<Void> ptr,
  RustBuffer ohttp_relay,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    RustBuffer,
    Pointer<Void>,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_withreplykey_process_response(
  Pointer<Void> ptr,
  RustBuffer response,
  Pointer<Void> post_ctx,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_withreplykeytransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_withreplykeytransition(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_withreplykeytransition_save(
  Pointer<Void> ptr,
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_withreplykeytransition_save_async(
  Pointer<Void> ptr,
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_createrequesterror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_createrequesterror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_createrequesterror_is_expired(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_createrequesterror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_createrequesterror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_decapsulationerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_decapsulationerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_decapsulationerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_decapsulationerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_senderbuildererror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_senderbuildererror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_eq_eq(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_senderbuildererror_uniffi_trait_eq_ne(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_senderreplayerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_senderreplayerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_senderreplayerror_is_expired(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_senderreplayerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_senderreplayerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_validationerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_validationerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_validationerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_validationerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_wellknownerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_wellknownerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_wellknownerror_code(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_wellknownerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_wellknownerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_bitcoindenv(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_bitcoindenv(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_bitcoindenv_get_bitcoind(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_bitcoindenv_get_receiver(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_bitcoindenv_get_sender(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_bitcoindinstance(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_bitcoindinstance(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_boxsendsyncerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_boxsendsyncerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_boxsendsyncerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_boxsendsyncerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_joinhandle(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_joinhandle(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_rpcclient(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_rpcclient(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(
    Pointer<Void>,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_method_rpcclient_call(
  Pointer<Void> ptr,
  RustBuffer method,
  RustBuffer params,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_testservices(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_testservices(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_constructor_testservices_initialize(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_testservices_cert(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_testservices_directory_url(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_testservices_fetch_ohttp_keys(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_testservices_ohttp_gateway_url(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_testservices_ohttp_relay_url(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_testservices_take_directory_handle(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_payjoin_ffi_fn_method_testservices_take_ohttp_relay_handle(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_method_testservices_wait_for_services_ready(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pjuri(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pjuri(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_pjuri_address(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_pjuri_amount_sats(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_pjuri_as_string(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_pjuri_pj_endpoint(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_pjuri_set_amount_sats(
  Pointer<Void> ptr,
  int amount_sats,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_uri(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_uri(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_constructor_uri_parse(
  RustBuffer uri,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_uri_address(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_uri_amount_sats(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_uri_as_string(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_method_uri_check_pj_supported(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_uri_label(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_uri_message(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_url(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_url(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_constructor_url_parse(
  RustBuffer input,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_url_as_string(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_payjoin_ffi_fn_method_url_query(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_feerateerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_feerateerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_feerateerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_feerateerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_intourlerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_intourlerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_intourlerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_intourlerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pjnotsupported(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pjnotsupported(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_eq_eq(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_pjnotsupported_uniffi_trait_eq_ne(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_pjparseerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_pjparseerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_eq_eq(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_payjoin_ffi_fn_method_pjparseerror_uniffi_trait_eq_ne(
  Pointer<Void> ptr,
  Pointer<Void> other,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_clone_urlparseerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_payjoin_ffi_fn_free_urlparseerror(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_urlparseerror_uniffi_trait_debug(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_payjoin_ffi_fn_method_urlparseerror_uniffi_trait_display(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_func_replay_receiver_event_log(
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_payjoin_ffi_fn_func_replay_receiver_event_log_async(
  Pointer<Void> persister,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_func_replay_sender_event_log(
  Pointer<Void> persister,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_payjoin_ffi_fn_func_replay_sender_event_log_async(
  Pointer<Void> persister,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_func_example_url(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_payjoin_ffi_fn_func_init_bitcoind_sender_receiver(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external void uniffi_payjoin_ffi_fn_func_init_tracing(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_func_invalid_psbt(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_func_original_psbt(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_func_payjoin_proposal(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer
uniffi_payjoin_ffi_fn_func_payjoin_proposal_with_sender_info(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_func_query_params(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<RustCallStatus>)>(assetId: _uniffiAssetId)
external RustBuffer uniffi_payjoin_ffi_fn_func_receiver_input_contribution(
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_payjoin_ffi_rustbuffer_alloc(
  int size,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(ForeignBytes, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_payjoin_ffi_rustbuffer_from_bytes(
  ForeignBytes bytes,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void ffi_payjoin_ffi_rustbuffer_free(
  RustBuffer buf,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(RustBuffer, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_payjoin_ffi_rustbuffer_reserve(
  RustBuffer buf,
  int additional,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_u8(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_u8(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_u8(Pointer<Void> handle);

@Native<Uint8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_u8(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_i8(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_i8(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_i8(Pointer<Void> handle);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_i8(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_u16(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_u16(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_u16(Pointer<Void> handle);

@Native<Uint16 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_u16(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_i16(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_i16(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_i16(Pointer<Void> handle);

@Native<Int16 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_i16(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_u32(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_u32(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_u32(Pointer<Void> handle);

@Native<Uint32 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_u32(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_i32(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_i32(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_i32(Pointer<Void> handle);

@Native<Int32 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_i32(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_u64(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_u64(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_u64(Pointer<Void> handle);

@Native<Uint64 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_u64(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_i64(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_i64(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_i64(Pointer<Void> handle);

@Native<Int64 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_payjoin_ffi_rust_future_complete_i64(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_f32(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_f32(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_f32(Pointer<Void> handle);

@Native<Float Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external double ffi_payjoin_ffi_rust_future_complete_f32(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_f64(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_f64(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_f64(Pointer<Void> handle);

@Native<Double Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external double ffi_payjoin_ffi_rust_future_complete_f64(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_rust_buffer(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_rust_buffer(
  Pointer<Void> handle,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_rust_buffer(
  Pointer<Void> handle,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_payjoin_ffi_rust_future_complete_rust_buffer(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_poll_void(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_cancel_void(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_payjoin_ffi_rust_future_free_void(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void ffi_payjoin_ffi_rust_future_complete_void(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_replay_receiver_event_log();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_replay_receiver_event_log_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_replay_sender_event_log();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_replay_sender_event_log_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_example_url();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_init_bitcoind_sender_receiver();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_init_tracing();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_invalid_psbt();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_original_psbt();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_payjoin_proposal();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_func_payjoin_proposal_with_sender_info();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_query_params();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_func_receiver_input_contribution();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_assumeinteractivetransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_assumeinteractivetransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_canbroadcast_callback();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_canceltransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_canceltransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_hasreplyableerror_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_hasreplyableerror_create_error_request();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_hasreplyableerror_process_error_response();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_hasreplyableerrortransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_hasreplyableerrortransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_initialreceivetransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_initialreceivetransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_initialized_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_initialized_create_poll_request();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_initialized_pj_uri();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_initialized_process_response();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_initializedtransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_initializedtransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_inputpair_outpoint();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_isoutputknown_callback();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_isscriptowned_callback();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersister_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersister_load();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersister_close();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersisterasync_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersisterasync_load();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersisterasync_close();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_maybeinputsowned_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsowned_check_inputs_not_owned();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsowned_extract_tx_to_schedule_broadcast();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsownedtransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsownedtransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_maybeinputsseen_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsseen_check_no_inputs_seen_before();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsseentransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_maybeinputsseentransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_monitor_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_monitor_check_for_transaction();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_monitortransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_monitortransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_outputsunknown_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_outputsunknown_identify_receiver_outputs();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_outputsunknowntransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_outputsunknowntransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_payjoinproposal_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_payjoinproposal_create_post_request();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_payjoinproposal_process_response();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_payjoinproposal_psbt();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_payjoinproposaltransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_payjoinproposaltransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_pendingfallbacktransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_pendingfallbacktransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_processpsbt_callback();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_provisionalproposal_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_provisionalproposal_finalize_proposal();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_provisionalproposal_psbt_to_sign();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_provisionalproposaltransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_provisionalproposaltransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_receiverbuilder_build();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_receiverbuilder_with_amount();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_receiverbuilder_with_expiration();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_receiverbuilder_with_max_fee_rate();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_receiverpendingfallback_close();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_receiverpendingfallback_fallback_tx();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_receiversessionevent_to_json();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_receiversessionhistory_fallback_tx();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_receiversessionhistory_pj_uri();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_receiversessionhistory_status();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_replayresult_session_history();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_replayresult_state();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_transactionfinder_callback();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayload_assume_interactive_receiver();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayload_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayload_check_broadcast_suitability();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayloadtransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayloadtransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsfeerange_apply_fee_range();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsfeerange_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsfeerangetransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsfeerangetransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsinputs_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsinputs_commit_inputs();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsinputs_contribute_inputs();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsinputs_try_preserving_privacy();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsinputstransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsinputstransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsoutputs_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsoutputs_commit_outputs();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsoutputs_output_substitution();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsoutputs_replace_receiver_outputs();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsoutputs_substitute_receiver_script();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wantsoutputstransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_wantsoutputstransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_receivercreaterequesterror_is_expired();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_receiverreplayerror_is_expired();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_broadcastedtransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_broadcastedtransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_initialsendtransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_initialsendtransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersister_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersister_load();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersister_close();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersisterasync_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersisterasync_load();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersisterasync_close();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_pollingforproposal_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_pollingforproposal_create_poll_request();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_pollingforproposal_process_response();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_pollingforproposaltransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_pollingforproposaltransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_senderbuilder_always_disable_output_substitution();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_senderbuilder_build_non_incentivizing();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_senderbuilder_build_recommended();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_senderbuilder_build_with_additional_fee();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_sendercanceltransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_sendercanceltransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_senderpendingfallback_close();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_senderpendingfallback_fallback_tx();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_senderreplayresult_session_history();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_senderreplayresult_state();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_sendersessionevent_to_json();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_sendersessionhistory_fallback_tx();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_sendersessionhistory_pj_param();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_sendersessionhistory_status();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_sendersessionoutcome_is_aborted();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_sendersessionoutcome_is_success();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_sendersessionoutcome_success_psbt_base64();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_v1context_process_response();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_withreplykey_cancel();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_withreplykey_create_v2_post_request();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_withreplykey_process_response();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_withreplykeytransition_save();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_withreplykeytransition_save_async();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_createrequesterror_is_expired();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_senderreplayerror_is_expired();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_wellknownerror_code();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_bitcoindenv_get_bitcoind();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_bitcoindenv_get_receiver();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_bitcoindenv_get_sender();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_rpcclient_call();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_testservices_cert();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_testservices_directory_url();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_testservices_fetch_ohttp_keys();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_testservices_ohttp_gateway_url();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_testservices_ohttp_relay_url();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_testservices_take_directory_handle();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_testservices_take_ohttp_relay_handle();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_method_testservices_wait_for_services_ready();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_pjuri_address();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_pjuri_amount_sats();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_pjuri_as_string();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_pjuri_pj_endpoint();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_pjuri_set_amount_sats();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_uri_address();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_uri_amount_sats();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_uri_as_string();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_uri_check_pj_supported();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_uri_label();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_uri_message();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_url_as_string();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_method_url_query();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_ohttpkeys_decode();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_inputpair_new();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_receiverbuilder_new();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_constructor_receiversessionevent_from_json();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_senderbuilder_new();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_payjoin_ffi_checksum_constructor_sendersessionevent_from_json();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_testservices_initialize();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_uri_parse();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_payjoin_ffi_checksum_constructor_url_parse();

@Native<Uint32 Function()>(assetId: _uniffiAssetId)
external int ffi_payjoin_ffi_uniffi_contract_version();

void _checkApiVersion() {
  final bindingsVersion = 30;
  final scaffoldingVersion = ffi_payjoin_ffi_uniffi_contract_version();
  if (bindingsVersion != scaffoldingVersion) {
    throw UniffiInternalError.panicked(
      "UniFFI contract version mismatch: bindings version \$bindingsVersion, scaffolding version \$scaffoldingVersion",
    );
  }
}

void _checkApiChecksums() {
  if (uniffi_payjoin_ffi_checksum_func_replay_receiver_event_log() != 13704) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_replay_receiver_event_log_async() !=
      48438) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_replay_sender_event_log() != 61032) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_replay_sender_event_log_async() !=
      16245) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_example_url() != 9077) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_init_bitcoind_sender_receiver() !=
      28338) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_init_tracing() != 4701) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_invalid_psbt() != 36471) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_original_psbt() != 16868) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_payjoin_proposal() != 2943) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_payjoin_proposal_with_sender_info() !=
      53802) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_query_params() != 34563) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_func_receiver_input_contribution() != 61519) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_assumeinteractivetransition_save() !=
      44208) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_assumeinteractivetransition_save_async() !=
      26091) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_canbroadcast_callback() != 1676) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_canceltransition_save() != 50170) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_canceltransition_save_async() !=
      38955) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_hasreplyableerror_cancel() != 9247) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_hasreplyableerror_create_error_request() !=
      28071) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_hasreplyableerror_process_error_response() !=
      35667) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_hasreplyableerrortransition_save() !=
      26653) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_hasreplyableerrortransition_save_async() !=
      37566) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialreceivetransition_save() !=
      3384) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialreceivetransition_save_async() !=
      42909) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialized_cancel() != 49935) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialized_create_poll_request() !=
      17891) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialized_pj_uri() != 53430) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialized_process_response() !=
      64865) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initializedtransition_save() !=
      48548) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initializedtransition_save_async() !=
      63235) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_inputpair_outpoint() != 5536) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_isoutputknown_callback() != 838) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_isscriptowned_callback() != 21846) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersister_save() !=
      45832) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersister_load() !=
      50793) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersister_close() !=
      14292) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersisterasync_save() !=
      748) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersisterasync_load() !=
      48869) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonreceiversessionpersisterasync_close() !=
      3309) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsowned_cancel() != 42531) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsowned_check_inputs_not_owned() !=
      52003) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsowned_extract_tx_to_schedule_broadcast() !=
      6222) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsownedtransition_save() !=
      2972) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsownedtransition_save_async() !=
      65300) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsseen_cancel() != 37490) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsseen_check_no_inputs_seen_before() !=
      18677) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsseentransition_save() !=
      21571) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_maybeinputsseentransition_save_async() !=
      12181) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_monitor_cancel() != 7413) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_monitor_check_for_transaction() !=
      8671) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_monitortransition_save() != 12399) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_monitortransition_save_async() !=
      62477) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_outputsunknown_cancel() != 29900) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_outputsunknown_identify_receiver_outputs() !=
      49601) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_outputsunknowntransition_save() !=
      19193) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_outputsunknowntransition_save_async() !=
      2791) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_payjoinproposal_cancel() != 2526) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_payjoinproposal_create_post_request() !=
      35676) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_payjoinproposal_process_response() !=
      37469) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_payjoinproposal_psbt() != 16269) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_payjoinproposaltransition_save() !=
      27143) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_payjoinproposaltransition_save_async() !=
      39796) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pendingfallbacktransition_save() !=
      39178) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pendingfallbacktransition_save_async() !=
      64579) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_processpsbt_callback() != 48978) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_provisionalproposal_cancel() !=
      23432) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_provisionalproposal_finalize_proposal() !=
      22895) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_provisionalproposal_psbt_to_sign() !=
      50683) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_provisionalproposaltransition_save() !=
      18164) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_provisionalproposaltransition_save_async() !=
      12995) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverbuilder_build() != 13647) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverbuilder_with_amount() !=
      2870) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverbuilder_with_expiration() !=
      29274) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverbuilder_with_max_fee_rate() !=
      58514) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverpendingfallback_close() !=
      60419) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverpendingfallback_fallback_tx() !=
      49510) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiversessionevent_to_json() !=
      41076) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiversessionhistory_fallback_tx() !=
      34756) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiversessionhistory_pj_uri() !=
      57310) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiversessionhistory_status() !=
      10385) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_replayresult_session_history() !=
      55491) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_replayresult_state() != 2251) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_transactionfinder_callback() !=
      45586) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayload_assume_interactive_receiver() !=
      52130) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayload_cancel() !=
      55717) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayload_check_broadcast_suitability() !=
      17121) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayloadtransition_save() !=
      32663) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uncheckedoriginalpayloadtransition_save_async() !=
      22782) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsfeerange_apply_fee_range() !=
      6849) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsfeerange_cancel() != 14665) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsfeerangetransition_save() !=
      12620) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsfeerangetransition_save_async() !=
      2420) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsinputs_cancel() != 5340) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsinputs_commit_inputs() != 4730) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsinputs_contribute_inputs() !=
      16107) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsinputs_try_preserving_privacy() !=
      21242) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsinputstransition_save() !=
      16591) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsinputstransition_save_async() !=
      62094) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputs_cancel() != 45182) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputs_commit_outputs() !=
      1691) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputs_output_substitution() !=
      11291) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputs_replace_receiver_outputs() !=
      62785) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputs_substitute_receiver_script() !=
      16083) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputstransition_save() !=
      24589) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wantsoutputstransition_save_async() !=
      24599) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receivercreaterequesterror_is_expired() !=
      38729) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_receiverreplayerror_is_expired() !=
      4741) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_broadcastedtransition_save() !=
      39673) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_broadcastedtransition_save_async() !=
      59857) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialsendtransition_save() !=
      42292) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_initialsendtransition_save_async() !=
      4981) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersister_save() !=
      10109) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersister_load() !=
      18359) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersister_close() !=
      51169) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersisterasync_save() !=
      44188) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersisterasync_load() !=
      1649) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_jsonsendersessionpersisterasync_close() !=
      26625) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pollingforproposal_cancel() != 47741) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pollingforproposal_create_poll_request() !=
      32643) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pollingforproposal_process_response() !=
      20754) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pollingforproposaltransition_save() !=
      27667) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pollingforproposaltransition_save_async() !=
      15565) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderbuilder_always_disable_output_substitution() !=
      28346) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderbuilder_build_non_incentivizing() !=
      42680) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderbuilder_build_recommended() !=
      13866) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderbuilder_build_with_additional_fee() !=
      28445) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendercanceltransition_save() !=
      1529) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendercanceltransition_save_async() !=
      31225) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderpendingfallback_close() !=
      21623) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderpendingfallback_fallback_tx() !=
      22130) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderreplayresult_session_history() !=
      16038) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderreplayresult_state() != 58633) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionevent_to_json() !=
      35461) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionhistory_fallback_tx() !=
      59565) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionhistory_pj_param() !=
      39510) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionhistory_status() !=
      51514) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionoutcome_is_aborted() !=
      55376) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionoutcome_is_success() !=
      61877) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_sendersessionoutcome_success_psbt_base64() !=
      40315) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_v1context_process_response() !=
      58909) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_withreplykey_cancel() != 21671) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_withreplykey_create_v2_post_request() !=
      7132) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_withreplykey_process_response() !=
      13691) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_withreplykeytransition_save() !=
      6324) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_withreplykeytransition_save_async() !=
      44204) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_createrequesterror_is_expired() !=
      56422) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_senderreplayerror_is_expired() !=
      44935) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_wellknownerror_code() != 42919) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_bitcoindenv_get_bitcoind() != 34541) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_bitcoindenv_get_receiver() != 9626) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_bitcoindenv_get_sender() != 47237) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_rpcclient_call() != 56783) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_cert() != 41547) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_directory_url() !=
      12582) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_fetch_ohttp_keys() !=
      4073) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_ohttp_gateway_url() !=
      42589) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_ohttp_relay_url() !=
      31527) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_take_directory_handle() !=
      25679) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_take_ohttp_relay_handle() !=
      45531) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_testservices_wait_for_services_ready() !=
      12699) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pjuri_address() != 27219) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pjuri_amount_sats() != 8108) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pjuri_as_string() != 64511) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pjuri_pj_endpoint() != 31776) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_pjuri_set_amount_sats() != 1859) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uri_address() != 34358) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uri_amount_sats() != 62466) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uri_as_string() != 46511) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uri_check_pj_supported() != 12792) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uri_label() != 39648) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_uri_message() != 20241) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_url_as_string() != 33295) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_method_url_query() != 23414) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_ohttpkeys_decode() != 15251) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_inputpair_new() != 8855) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_receiverbuilder_new() != 10505) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_receiversessionevent_from_json() !=
      14154) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_senderbuilder_new() != 52547) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_sendersessionevent_from_json() !=
      23826) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_testservices_initialize() !=
      52011) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_uri_parse() != 41914) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_payjoin_ffi_checksum_constructor_url_parse() != 51375) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
}

void ensureInitialized() {
  _checkApiVersion();
  _checkApiChecksums();
}

@Deprecated("Use ensureInitialized instead")
void initialize() {
  ensureInitialized();
}
