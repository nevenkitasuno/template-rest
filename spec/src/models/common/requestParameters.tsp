import "@typespec/http";

using TypeSpec.Http;

model VersionFromHeader {
    @header
    clientVersion?: string;
}