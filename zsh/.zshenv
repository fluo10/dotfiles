typeset -U path PATH
path=(~/.cargo/bin ~/.local/bin $path)
export PATH

if [[ "$OSTYPE" == linux* ]] then
    # pnpm
    export PNPM_HOME="/home/fluo10/.local/share/pnpm"
    case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
fi