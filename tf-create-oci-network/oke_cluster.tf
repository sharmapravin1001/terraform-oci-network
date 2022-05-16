resource "oci_containerengine_cluster" "k8s_cluster" {
  compartment_id     = "var.root_compartment_id"
  kubernetes_version = "var.oke_cluster.version"
  name               = "var.oke_cluster.name"
  vcn_id             = "oci_core_vcn.pravinvcn.id"
  }
 
resource "oci_containerengine_node_pool" "k8s_node_pool" {
  cluster_id         = "oci_containerengine_cluster.k8s_cluster.id"
  compartment_id     = "var.root_compartment_id"
  kubernetes_version = "var.oke_cluster.version"
  name               = "var.oke_cluster.name"
  node_image_name    = "var.worker_ol_image_name"
  node_shape         = "var.oke_cluster.shape"
  ssh_public_key      = "file(var.ssh_public_key_file)"
}
 

data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id    = "oci_containerengine_cluster.k8s_cluster.id"
  expiration    = 2592000
  token_version = "1.0.0"
}
 

resource "local_file" "kubeconfig" {
  content  = "data.oci_containerengine_cluster_kube_config.cluster_kube_config.content"
  filename = "{path.module}/kubeconfig"
}
