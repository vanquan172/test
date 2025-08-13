
class bas_seq extends uvm_sequence#(item);
    `uvm_object_utils(bas_seq)
    function new(string name = "bas_seq"); 
        super.new(name); 
    endfunction 

    rand int num; 
    constraint c_num_seq { soft num inside {[20:40]};}

    rand bit [3:0] select_extension; 
    constraint c_select_extension {soft select_extension inside {
                                                            RV32I   ,
                                                            RV64I   ,
                                                            RV32M   ,
                                                            RV64M   ,
                                                            RV32A   ,
                                                            RV64A   
                                                            }; 
    }

    item seq_item; 
    task body(); 
        for (int i = 0; i < num ; i++) begin 
            seq_item = item::type_id::create("seq_item");
            start_item(seq_item); 
            seq_item.randomize() with { extension == select_extension; }; 
            `uvm_info(get_type_name(),$sformatf("[BSEQ] RV_Type = %b",seq_item.extension), UVM_HIGH);
            finish_item(seq_item); 
        end 
     
    endtask 
endclass