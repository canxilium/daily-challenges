import Char "mo:base/Char";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Prim "mo:prim";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Iter  "mo:base/Iter";

actor {
    
  //Challenge 1
   
    public func nat_to_nat8(n : Nat) : async Nat8 
    {
      if (n > 255)
          Debug.trap("over 255 chars")
      else
      {
        return(Nat8.fromNat(n))
      };
    };

  //Challenge 2
    
    public func max_number_with_n_bits(n:Nat) : async Nat{
        return 2**n;
    }; 

  //Challenge 3: 
    public func decimal_to_bits(num : Nat) : async Text
    {
      var natBit = 0;
      var p = 0;
      var temp = num;
      while (temp > 0)
      {
        natBit += (temp % 2) * (10 ** p);
        p += 1;
        temp := temp / 2;
      };
      let bits = Nat.toText(natBit);
      return bits;
    };

    //Challenge 4: 
      public func capitalize_character(c : Nat32) : async Text
      {
        if (c < 97 or c > 122)
          Debug.trap("oops!");
        let char : Char = Char.fromNat32(c - 32);
        return Char.toText(char);
      };

  //Challenge 5: 
      public func capitalize_text(t : Text) : async Text
      {
        return Text.map(t , Prim.charToUpper);
      };

    //challenge 6
    public func is_inside(t: Text, c: Char) : async Bool{
        return Text.contains(t, #char c);
    };

    //challenge 7
    public func trim_whitespace(t: Text) : async Text{
        return Text.trim(t, #text " ");
    };

    //challenge 8
    public func duplicated_character(t: Text) : async Text{
        var arr_text:[Char] = Iter.toArray(t.chars());
        var size:Nat = arr_text.size();
        var character_index:Nat = 0;
        for(i in Iter.range(0, size-1)){
          character_index := i;
          for(j in Iter.range(i+1, size-1)){
            if(arr_text[i] == arr_text[j]){
              character_index := j;
            } 
          };
          if(character_index != i){
            var result: Char =  arr_text[character_index];
            return Char.toText(result);
          };
        };
        return t;
    };

  //Challenge 9 : 
    public func size_in_bytes (t: Text) : async Nat
    {
      let b : Blob = Text.encodeUtf8(t);
      return b.size();
    };

  //Challenge 10: 
    public func bubble_sort (arr : [Nat]) : async [Nat] 
    {
      let tmpArr : [var Nat] = Array.thaw(arr);
      let size = tmpArr.size();
      var temp = 0;
      
      var i = 0;
      var j = 0;
      var b : Bool = false;
      label loop1 for(i in range(0, size - 2))
      {
        b := false;
        for(j in range(0, size - i - 2))
        {
          if (tmpArr[j] > tmpArr[j+1])
          {
            temp := tmpArr[j];
            tmpArr[j] := tmpArr[j+1];
            tmpArr[j+1] := temp;
            b := true;
          };
        };
        if (b == false)
          break loop1;
      };
      return Array.freeze(tmpArr);
    }; 
    
    class range(x : Nat, y : Int) {
      var i = x;
      public func next() : ?Nat {
        if (i > y) {
          null
        } else {
          let j = i;
          i += 1;
          ?j
        }
      };
    };

};