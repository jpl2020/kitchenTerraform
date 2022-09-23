control "file_check" do
    describe file('./test/fixtures/tf_module/foobar') do
      it { should exist }
    end
  end

control "gcp-compute" do
    describe google_compute_instance(project: 'panw-355016', zone: 'us-central1-a', name: 'apurv-instance-1') do
      it { should exist }
      its('machine_type') { should match 'e2-medium' }
      # its('scheduling_preemptible') { should be false }
      # its('network_interfaces_subnetwork') { should include 'https://www.googleapis.com/compute/v1/projects/searce-playground-v1/regions/us-central1/subnetworks/priyanka-gke-subnet' }
      # its('network_interfaces_count') { should be 1 }
      # its('service_account_scopes') { should include 'https://www.googleapis.com/auth/devstorage.read_only' }
       end
  end

# control "gcp-firewall" do
#     describe google_compute_firewall(project: 'panw-355016', name: 'apurv-firewall') do
#       its('direction') { should cmp 'INGRESS' }
#       # its('log_config_enabled?') { should be false }
#       # its('source_tags') { should include 'some-tag' }
#     end
#   end

# control "gcp-network" do
#     describe google_compute_network(project: 'panw-355016', name: 'default') do
#       it { should exist }
#       # its('routing_config.routing_mode') { should cmp 'GLOBAL' }
#       its ('auto_create_subnetworks'){ should be false }
#       its ('subnetworks.count') { should eq 1 }
#       its ('subnetworks.first') { should match "public-subnet"}
#       # its('peerings.state') { should be 'ACTIVE' }
#       end
#   end

# control "gke-cluster" do
#     describe google_container_cluster(project: 'panw-355016', location: 'us-central1-a', name: 'apurv-test-cluster') do
#       it { should exist }
#       its('status') { should eq 'RUNNING' }
#       its('network') {should eq "default"}
#       its('subnetwork') {should eq "default"}
#     end
#   end