from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/run-command', methods=['GET'])
def run_command():
    command = request.args.get('cmd')
    if not command:
        return jsonify({"message": "No command provided"}), 400

    try:
        # Map commands to installer script functions
        command_map = {
            "install_python": "bash installer_script.sh install_python",
            "install_node": "bash installer_script.sh install_node",
            "install_git": "bash installer_script.sh install_git",
            "install_llm": "bash installer_script.sh install_llm",
            "install_client": "bash installer_script.sh install_client",
            "install_mcps": "bash installer_script.sh install_mcps"
        }

        if command not in command_map:
            return jsonify({"message": "Invalid command"}), 400

        # Execute the mapped command
        subprocess.run(command_map[command], shell=True, check=True)
        return jsonify({"message": f"{command} executed successfully!"})
    except subprocess.CalledProcessError:
        return jsonify({"message": f"Failed to execute {command}"}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
