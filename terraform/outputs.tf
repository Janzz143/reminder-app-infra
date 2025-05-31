output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "app_instance_public_ip" {
  value = aws_instance.app.public_ip
}

output "jenkins_instance_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.reminder_app.repository_url
}

output "load_balancer_dns_name" {
  value = aws_lb.app_lb.dns_name
}

