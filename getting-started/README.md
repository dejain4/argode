# Getting Started with Argo CD

## Requirements

Before you begin, make sure you have the following requirements in place:

* Install the `kubectl` command-line tool. You can find installation instructions [here](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
* Have a `kubeconfig` file. By default, it should be located at `~/.kube/config`. If you don't have one, you can follow the instructions [here](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/) to create it.

## 1. Installing Argo CD

To install Argo CD, follow these steps:

1. Make the installation script executable:

   ```bash
   chmod +x install_argocd.sh
   ```

2. Run the installation script:

   ```bash
   ./install_argocd.sh
   ```

   This script will create a new namespace called `argocd` where Argo CD services and application resources will be deployed.

   **Note**: If you intend to install Argo CD into a different namespace, ensure that you update the namespace reference in the installation manifests.

## 2. Downloading the Argo CD CLI

To use the Argo CD command-line interface (CLI), you need to download it. Follow these steps:

1. Visit [https://github.com/argoproj/argo-cd/releases/latest](https://github.com/argoproj/argo-cd/releases/latest) to download the latest version of Argo CD.
2. If you are using Mac, Linux, or WSL (Windows Subsystem for Linux), you can also install it using Homebrew:

   ```bash
   brew install argocd
   ```

   Additional installation instructions can be found in the [CLI installation documentation](cli_installation.md).

## 3. Accessing the Argo CD API Server

By default, the Argo CD API server is not exposed with an external IP. To access the API server, you can choose one of the following techniques:

### Using a Load Balancer Service

1. Change the service type of the `argocd-server` to `LoadBalancer`:

   ```bash
   kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
   ```

## 4. Logging in to Argo CD using the CLI

To log in to Argo CD using the CLI, follow these steps:

1. Retrieve the initial auto-generated password for the `admin` account by running the following command:

   ```bash
   argocd admin initial-password -n argocd
   ```

   This will display the password in clear text.

   **Note**: Once you have changed the password, it is recommended to delete the `argocd-initial-admin-secret` from the Argo CD namespace. This secret is only used to store the initially generated password and can be safely deleted.

2. Change the password using the command:

   ```bash
   argocd account update-password
   ```

## 5. Port Forwarding

You can also use port forwarding with `kubectl` to access the Argo CD API server without exposing the service externally. Follow these steps:

1. Run the following command to set up port forwarding:

   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   ```

2. Access the API server by visiting [https://localhost:8080](https://localhost:8080).

Remember to substitute `argocd` with your desired namespace if you have chosen a different one during the installation.

Enjoy using Argo CD! If you

 have any questions or need further assistance, feel free to ask.