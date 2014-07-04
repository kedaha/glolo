# jasmine.Matchers.prototype.toHaveItemsBeInThisOrder = function(){
#     var arr = this.actual
#       , expectedItems = arguments
#     for (var i = 0, len = expectedItems.length - 1; i < len; i++){
#         var first = expectedItems[i]
#           , second = expectedItems[i + 1]
#         if (arr.indexOf(first) === -1 || arr.indexOf(second) === -1)
#             return false
#         if (arr.indexOf(first) >= arr.indexOf(second)) return false
#     }
#     return true
# }
