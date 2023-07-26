import 'package:flutter/material.dart';

final carparksController = TextEditingController();
final bedsController = TextEditingController();
final bathroomsController = TextEditingController();
final purchasepriceController = TextEditingController();
final valueController = TextEditingController();
final loanController = TextEditingController();
final rentController = TextEditingController();
final propertyAddressController = TextEditingController();
final datePurchaseController = TextEditingController();
final leaseStartDateController = TextEditingController();
final leaseStartDateend = TextEditingController();
final policyNumberController = TextEditingController();
final policyStartController = TextEditingController();
final policyEndController = TextEditingController();
final contactNameController = TextEditingController();
final companyNameController = TextEditingController();
final numberController = TextEditingController();
final emailController = TextEditingController();
final addressController = TextEditingController();

final insuranceEmailController = TextEditingController();
final insuranceNameController = TextEditingController();
final insurancePhoneController = TextEditingController();

final agentController = TextEditingController();

double? lat;
double? lng;

//Contact
TabController? tabController;
List typesList = ["Agents", "Insurers"];

//Account Controllers
final emailAccountController = TextEditingController();
final phoneAccountController = TextEditingController();
final addressAccountController = TextEditingController();

//AgentTabControllers
final agentTabNameControllers = TextEditingController();
final agentTabCompanyControllers = TextEditingController();
final agentTabNumbersControllers = TextEditingController();
final agentTabEmailControllers = TextEditingController();
final agentTabAddresslControllers = TextEditingController();

//Show Controllers
final showrentController = TextEditingController();
final showleaseStartDateController = TextEditingController();
final showagentController = TextEditingController();
final showleaseStartDateend = TextEditingController();
final showinsuranceNameController = TextEditingController();
final showpolicyStartController = TextEditingController();
final showinsuranceNameControllers = TextEditingController();
final showpolicyEndController = TextEditingController();

//Add Account
final addAddressEmailController = TextEditingController();
final addAddressController = TextEditingController();
final addAddressNumberController = TextEditingController();

//Alert Widget
final alertwidgetaddagentNameController = TextEditingController();
final alertWidgetaddAgentCompanyController = TextEditingController();
final alertWidgetaddNumbercontroller = TextEditingController();
final alertWidgetaddAgentEmailController = TextEditingController();
final addagentalrertaddresscontroller = TextEditingController();

final alertwidgetinsuranceNameController = TextEditingController();
final alertWidgetinsurancePhoneController = TextEditingController();
final alertinsuranceEmailController = TextEditingController();
