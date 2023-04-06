resource "kubernetes_namespace" "nginx-namespace" {

  depends_on = [time_sleep.wait_for_kubernetes]
  metadata {
    name = "nginx-ingress"
  }
}