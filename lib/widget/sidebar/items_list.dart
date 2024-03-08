import 'package:common/widget/sidebar/item_model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

List<SidebarItem> items = [
  pipelines,
  campaigns,
  users,
  visas,
  blog,
  packages,
  fulfillment
];

SidebarItem pipelines = SidebarItem(
    label: "sidebar-pipelines".i18n(),
    icon: Icons.timeline,
    route: '/pipelines');
SidebarItem campaigns = SidebarItem(
    label: "sidebar-campaigns".i18n(),
    icon: Icons.account_tree,
    route: '/campaigns');
SidebarItem users = SidebarItem(
    label: "sidebar-users".i18n(),
    icon: Icons.supervised_user_circle_outlined,
    route: '/users-screen');
SidebarItem blog =
    SidebarItem(label: "sidebar-blog".i18n(), icon: Icons.edit, route: '/blog');
SidebarItem packages = SidebarItem(
    label: "sidebar-packages".i18n(), icon: Icons.payments, route: '/packages');
SidebarItem visas = SidebarItem(
    label: "sidebar-visa".i18n(), icon: Icons.flight, route: '/visas');
SidebarItem fulfillment = SidebarItem(
    label: "sidebar-transaction".i18n(),
    icon: Icons.feed_outlined,
    route: '/search-pipeline');
