{ pkgs }: {
    deps = [
        pkgs.bashInteractive
        pkgs.man
        pkgs.caddy
        pkgs.tmux
        pkgs.jre8
    ];
}