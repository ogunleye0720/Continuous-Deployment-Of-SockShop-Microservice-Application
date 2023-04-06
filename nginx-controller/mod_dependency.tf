resource "time_sleep" "wait_for_kubernetes" {

    depends_on = [
        data.aws_eks_cluster.ogunleye_cluster
    ]

    create_duration = "20s"
}