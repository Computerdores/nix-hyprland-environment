{ pkgsUnstable, ... }:
{
    programs.vscode = {
        enable = true;
        package = pkgsUnstable.vscode.fhsWithPackages (ps: with ps; [ zstd libusb1 ]);
    };
}
