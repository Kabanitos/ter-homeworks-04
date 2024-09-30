output "id-vpc-info" {
  value =  yandex_vpc_network.test
}


output "vpc-subnet-info" {
    value = yandex_vpc_subnet.sub-test
  
}

output "subnet_id" {
   value = yandex_vpc_subnet.sub-test.id
}

output "vpc_id" {
   value = yandex_vpc_network.test.id
}