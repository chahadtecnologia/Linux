# Systemd options analysis

## 1. Status and State Monitoring

- systemctl status [service_name]: Shows if the service is running, memory usage, main PID, and the most recent log lines.

- systemctl list-units --type=service --state=running: Lists all applications currently in execution.

- systemctl list-units --state=failed: Filters only for services that failed to start or crashed.

- systemctl show [service_name]: Displays internal properties in a key=value format (ideal for automation/scripting).

## 2. Log Analysis (Debugging)

- journalctl -u [service_name]: Displays all logs specific to a single application.

- journalctl -fu [service_name]: Follows logs in real-time (similar to tail -f).

- journalctl -u [service_name] --since "1 hour ago": Filters logs generated within the last hour.

- journalctl -p err..warning: Shows only messages classified as errors or warnings, filtering out noise.

## 3. Performance and Boot Diagnostics

- systemd-analyze blame: Lists all services started at boot, sorted by how long they took to initialize.

- systemd-analyze critical-chain [service_name]: Shows the dependency tree and pinpoint where the time bottleneck is for a specific service.

- systemd-analyze plot > analysis.svg: Generates a detailed visual SVG chart of the entire system boot sequence.

- systemd-cgls: Lists processes hierarchically within "Control Groups," showing exactly which child processes an application spawned.

## 4. Security and Sandboxing

- systemd-analyze security [service_name]: Performs a security audit of the unit file, assigning an "exposure score" and suggesting isolation improvements.