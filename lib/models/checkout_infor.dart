
class CheckoutInfor {
  final int totalQuantity;
  final double totalPrice;
  final double totalDiscount;
  final double totalAfterDiscount;

  const CheckoutInfor({ this.totalQuantity = 0,  this.totalPrice =0 ,  this.totalDiscount =0 ,  this.totalAfterDiscount = 0});

  @override
  toString() => 'CheckoutInfor(totalQuantity: $totalQuantity, totalPrice: $totalPrice, totalDiscount: $totalDiscount, totalAfterDiscount: $totalAfterDiscount)';

  }