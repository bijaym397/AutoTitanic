part of '../inventory_controller.dart';

mixin InventoryAPIMixin {
  InventoryController get _controller => Get.find<InventoryController>();

  Future<void> getVehicles() async {
    _controller.vehicles.clear();
    var res = await _controller._viewModel.getVehicles(
      page: _controller.pageNumber,
      limit: _controller.selectedPageLimit,
    );
    _controller.vehicles = [
      ...res,
      ...List.generate(
        _controller.selectedPageLimit - res.length,
        (_) => _controller.inventory,
      ),
    ];
    _controller.update([InventoryView.updateId]);
  }
}
