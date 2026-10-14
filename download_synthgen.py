import shutil
from pathlib import Path
from huggingface_hub import snapshot_download

OUT_DIR = Path("synthgen")

snapshot_download(
    repo_id="EdwardSJ151/synthgen",
    repo_type="dataset",
    local_dir=OUT_DIR,
)

shutil.rmtree(OUT_DIR / ".cache", ignore_errors=True)
