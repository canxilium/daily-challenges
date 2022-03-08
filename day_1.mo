import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
actor {
    //Challenge 1
    public func add(n : Nat, m: Nat) : async Nat {
    return (n + m);};
    //Challenge 2
    public func square(n : Nat) : async Nat {
    return (n*n);};
    //Challenge 3
    public func days_to_seconds(n : Nat) : async Nat {
    return (n*24*60*60);};
    //Challenge 4
    var count:Nat=0;
    public func increment_counter(plusx:Nat) : async Nat {count := count + plusx;
    return count;};
    public func clear_counter() : async Nat {count:=0;return count;};
    //Challenge 5
    public func divide(n:Nat,m:Nat) : async Bool{
        if(n%m == 0) {
    return (true);}
        else {
    return (false);};
    };
    //Challenge 6
    public func is_even(n:Nat) : async Bool{
        if(n%2 == 0) {
    return (true);}
        else {
    return (false);};
    };
    //Challenge 7
    var sum:Nat=0;
    public func sum_of_array(a:[Nat]) : async Nat {
        if(a.size() == 0)   
        {    return (0)}
        else {
            for(value in a.vals()) {sum := sum + value;
            };return (sum)
    };
    };
    // Challenge 8 :
    public func maximum(arr : [Nat]) : async Nat{
        if(arr.size() == 0){
            return 0;
        } else {
            var max = arr[0];
            for (num in arr.vals()){
                if(num > max){
                    max := num;
                }
            };
            return max;
        };
    };

    // Challenge 9 :
    public func remove_from_array (arr : [Nat], n : Nat) : async [Nat]{
        return Array.filter(arr, func (num : Nat) : Bool{
            return num != n;
        });
    };

    // Challenge 10 :
    public func selection_sort (arr : [Nat]) : async [Nat]{
        var new_arr : [var Nat] = Array.thaw(arr);
        var size = new_arr.size();
        for(i in Iter.range(0, size-1)){
            var min_index = i;
            for(j in Iter.range(i+1, size-1)){
                if(new_arr[j] < new_arr[min_index]){
                    min_index := j;
                };
            };
            if(min_index != i){
                var temp = new_arr[i];
                new_arr[i] := new_arr[min_index];
                new_arr[min_index] := temp;
            }
        };
        return Array.freeze(new_arr);
    };
}