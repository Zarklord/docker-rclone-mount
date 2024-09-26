group "ci_targets" {
  targets = ["rclone-mount"]
}
target "ci_platforms" {
	platforms = ["linux/amd64", "linux/arm64"]
}

target "docker-metadata-action" {}

group "default" {
  targets = ["rclone-mount"]
}

target "rclone-mount-local" {
  tags = ["rclone-mount:local"]
}

target "rclone-mount" {
	inherits = ["rclone-mount-local", "ci_platforms", "docker-metadata-action"]
	context = "rclone-mount"
	dockerfile = "Dockerfile"
}