output "out" {

    value=concat(module.test-vm.fqdn , module.example-vm.fqdn)
}

output "out-network" {
  value=module.network
}