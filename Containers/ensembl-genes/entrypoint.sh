#!/usr/bin/env bash
set -euo pipefail

commands=(
  pre_release_ftp
  main_static_content
  start_pipeline_from_registry
  beta_patcher
  core_meta_data
  busco_lineage_selector
  busco_metakeys_patch
  check_busco_score
  write_yaml
  pid_overlap
  bioproject_tracking
  live_tracking
  check_for_transcriptomic
  get_transcriptomic_data
  select_transcriptomic_data
)

show_help() {
  cat <<'EOF'
Ensembl Genes container command dispatcher.

Usage:
  ensembl-genes help
  ensembl-genes list
  ensembl-genes <command> [args...]

Available commands:
  pre_release_ftp
  main_static_content
  start_pipeline_from_registry
  beta_patcher
  core_meta_data
  busco_lineage_selector
  busco_metakeys_patch
  check_busco_score
  write_yaml
  pid_overlap
  bioproject_tracking
  live_tracking
  check_for_transcriptomic
  get_transcriptomic_data
  select_transcriptomic_data
EOF
}

if [[ $# -eq 0 ]]; then
  show_help
  exit 0
fi

case "$1" in
  help|-h|--help|list)
    show_help
    exit 0
    ;;
esac

cmd="$1"
shift

for allowed in "${commands[@]}"; do
  if [[ "$cmd" == "$allowed" ]]; then
    exec "$cmd" "$@"
  fi
done

echo "Unknown command: $cmd" >&2
show_help >&2
exit 1
