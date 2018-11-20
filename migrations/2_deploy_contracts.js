var ethertoken = artifacts.require("./ethertoken.sol");

module.exports = function(deployer) {
	const _name = "wrap_eth";
	const _symbol = "weth";
  	deployer.deploy(ethertoken, _name, _symbol);
};