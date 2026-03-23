# ── cmd: version ───────────────────────────────────────────────

cmd_version() {
    local method
    method=$(_install_method)

    local method_label
    case "$method" in
        npm)  method_label="npm (Node)" ;;
        bash) method_label="bash (Shell Script)" ;;
        *)    method_label="unknown" ;;
    esac

    echo "cac $CAC_VERSION"
    echo "安装方式: $method_label"
}
