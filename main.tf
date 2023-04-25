module "hub" {
  source     = "./hub"
  hub_prefix = var.hub_prefix
}

module "spoke1" {
  source       = "./spoke1"
  spoke_prefix = "${var.spoke_prefix}1"
}

module "spoke2" {
  source       = "./spoke2"
  spoke_prefix = "${var.spoke_prefix}2"
}

module "peering" {
  source        = "./vnet_peering"
  hub_rg_name   = module.hub.hub_rg_name
  hub_vnet_id   = module.hub.hub_vnet_id
  hub_vnet_name = module.hub.hub_vnet_name

  spoke1_rg_name   = module.spoke1.spoke1_rg_name
  spoke1_vnet_id   = module.spoke1.spoke1_vnet_id
  spoke1_vnet_name = module.spoke1.spoke1_vnet_name

  spoke2_rg_name   = module.spoke2.spoke2_rg_name
  spoke2_vnet_id   = module.spoke2.spoke2_vnet_id
  spoke2_vnet_name = module.spoke2.spoke2_vnet_name
}
