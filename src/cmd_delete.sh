# ── cmd: delete（卸载）────────────────────────────────────────

cmd_delete() {
    echo "=== cac delete ==="
    echo

    local rc_file
    rc_file=$(_detect_rc_file)

    _remove_path_from_rc "$rc_file"

    if [[ -d "$CAC_DIR" ]]; then
        rm -rf "$CAC_DIR"
        echo "  ✓ 已删除 $CAC_DIR"
    else
        echo "  - $CAC_DIR 不存在，跳过"
    fi

    local method
    method=$(_install_method)
    echo
    if [[ "$method" == "npm" ]]; then
        echo "  ✓ 已清除所有 cac 数据和配置"
        echo
        echo "要完全卸载 cac 命令，请执行："
        echo "  npm uninstall -g claude-cac"
    else
        if [[ -f "$HOME/bin/cac" ]]; then
            rm -f "$HOME/bin/cac"
            echo "  ✓ 已删除 $HOME/bin/cac"
        fi
        echo "  ✓ 卸载完成"
    fi

    echo
    if [[ -n "$rc_file" ]]; then
        echo "请重开终端或执行 source $rc_file 使变更生效。"
    else
        echo "请重开终端使变更生效。"
    fi
}
