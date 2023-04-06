resource "kubernetes_ingress_v1" "voting-ingress" {
  metadata {
    name      = "azure-vote-front"
    labels = {
      name = "azure-vote-front"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "votingapp.ogunleye1995.me"
      http {
        path {
          backend {
            service{
              name = "azure-vote-front"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "sock_shop-ingress" {
  metadata {
    name      = "sock-shop"
    namespace = "sock-shop-namespace"
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "sock-shop.ogunleye1995.me"
      http {
        path {
          backend {
            service{
              name = "front-end"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "prometheus-ingress" {
  metadata {
    name      = "prometheus"
    namespace = "monitoring"
    labels = {
      name = "prometheus-grafana"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "prometheus.ogunleye1995.me"
      http {
        path {
          backend {
            service{
              name = "prometheus-grafana"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

