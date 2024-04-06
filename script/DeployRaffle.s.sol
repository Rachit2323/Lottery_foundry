// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Raffle} from "../src/Raffle.sol";
// import {AddConsumer, CreateSubscription, FundSubscription} from "./Interactions.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig(); // This comes with our mocks!
        // AddConsumer addConsumer = new AddConsumer();
        (
            uint256 entranceFees,
        uint256 interval,
        address vrfCoordinator,
        bytes32 gasLane,
        uint64 subscriptionId,
        uint32 callbackGasLimit
        ) = helperConfig.activeNetworkConfig();

        // if (subscriptionId == 0) {
        //     CreateSubscription createSubscription = new CreateSubscription();
        //     (subscriptionId, vrfCoordinatorV2) = createSubscription.createSubscription(
        //         vrfCoordinatorV2,
        //         deployerKey
        //     );

        //     FundSubscription fundSubscription = new FundSubscription();
        //     fundSubscription.fundSubscription(
        //         vrfCoordinatorV2,
        //         subscriptionId,
        //         link,
        //         deployerKey
        //     );
        // }

        vm.startBroadcast();
        Raffle raffle = new Raffle(
             entranceFees,
         interval,
         vrfCoordinator,
         gasLane,
         subscriptionId,
         callbackGasLimit
        );
        vm.stopBroadcast();


        // addConsumer.addConsumer(
        //     address(raffle),
        //     vrfCoordinatorV2,
        //     subscriptionId,
        //     deployerKey
        // );
        return (raffle, helperConfig);
    }
}