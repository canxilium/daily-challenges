import Debug "mo:base/Debug";
import Array "mo:base/Array";
actor {
    
  //Challenge 1
    
    private func swap(a : [var Nat], j : Nat, i : Nat) : async Nat 
    { 
      //debug
      if (i > a.size())      
      Debug.trap("index limit");
      if (j > a.size())      
      Debug.trap("index limit");

      //swap
     var temp :Nat = 0;
         temp := a[i];
         a[i] := a[j];
         a[j] := temp;
     return Array.freeze(a);

    };
    //Challenge 2
   public func init_count(n : Nat): async [Nat]{
        var f = func( x : Nat) : Nat { return x;};
        return Array.tabulate<Nat>(n, f);
    };

     //Challenge 3
     public func seven (arr : [Nat]): async Text{
        for(i in Iter.range(0, arr.size() - 1)){
            if(arr[i] == 7){
                return "Seven is found"
            }
        };
        return "Seven not found";
    };

     //Challenge 4
    public func nat_opt_to_nat(n: ?Nat, m: Nat) : async Nat{
        return Option.get<Nat>(n, m);
    };
    
    //Challenge 5
    public func day_of_the_week (n: Nat): async ?Text{
        var result: ?Text = null;
        result := switch n{
            case 1 ?"Moday";
            case 2 ?"Tuesday";
            case 3 ?"Wednesday";
            case 4 ?"Thursday";
            case 5 ?"Friday";
            case 6 ?"Saturday";
            case 7 ?"Sunday";
            case default null;
        };
        return result;
    };
     
     //Challenge 6
    public func populate_array(arr : [?Nat]) : async [Nat]{
        return Array.map<?Nat, Nat>(arr, func (num : ?Nat) : Nat{
          if(num == null){
            return 0;
          }
          else return Option.unwrap(num);
        });
    };
     
     //Challenge 7
    public func sum_of_array(arr : [Nat]) : async Nat{
        var sum:Nat = 0;
        var new_arr:[Nat] = Array.map<Nat, Nat>(arr,  func(num : Nat) : Nat{
          sum := sum + num;
          return sum;
        });
        return sum;
    };  

     //Challenge 8
   public func squared_array(arr: [Nat]) : async [Nat]{
        return Array.map<Nat, Nat>(arr, func (num : Nat) : Nat{
          return num ** 2;
        });
    };

     //Challenge 9
    public func increase_by_index(arr: [Nat]) : async [Nat]{
        return Array.mapEntries<Nat, Nat>(arr,func (num : Nat, index) : Nat{
          return index + num;
        });
    };

     //Challenge 10
    private func contains<A>(array : [A], a : A, f : (A, A) -> Bool) : async Bool{
      for(item in Array.vals<A>(array)){
        if(a == item){
          return true;
        };
      };
      return false;
    };

};
