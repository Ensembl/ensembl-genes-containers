#!/usr/bin/env bash
set -euo pipefail

show_help() {
  cat <<'EOF'
Ensembl Genes QC development container.

Usage:
  ensembl-genes-qc-dev help
  ensembl-genes-qc-dev list
  ensembl-genes-qc-dev parse-agat [args...]
  ensembl-genes-qc-dev paths

Commands:
  parse-agat
    Run the parse_agat.py script from the feature/run_metrics branch checkout.

  paths
    Print useful in-container QC file locations.
EOF
}

if [[ $# -eq 0 ]]; then
  show_help
  exit 0
fi

cmd="$1"
shift

case "$cmd" in
  help|-h|--help|list)
    show_help
    ;;
  parse-agat)
    exec python /opt/ensembl-genes/src/python/ensembl/genes/annotation-qc/parsers/parse_agat.py "$@"
    ;;
  paths)
    cat <<EOF
ENSEMBL_GENES_QC_ROOT=${ENSEMBL_GENES_QC_ROOT}
ENSEMBL_GENES_QC_VALUE_MAP=${ENSEMBL_GENES_QC_VALUE_MAP}
EOF
    ;;
  *)
    echo "Unknown command: $cmd" >&2
    show_help >&2
    exit 1
    ;;
esac
