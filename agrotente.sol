pragma solidity ^0.4.17;
contract Agrotente {
   
   
    struct registro {
        string  usuario; //nif del usuario que realiza el dato
        string parcela; //referencia catastral
        string tipo_dato; //tipo de dato
        string dato;  //valor del dato
        string fecha; // fecha incorporacion dato
    }
    
    registro[] public registros;
    registro[] public vectorResultados;
    
    function  entraDato(string memory usuario, string memory parcela, string memory tipo_dato, string memory dato, string memory fecha) public{
        registros.push(registro({
            usuario:    usuario,
            parcela:    parcela,
            tipo_dato:  tipo_dato,
            dato:       dato,
            fecha:      fecha
        }));
        
    }
  
   function recuperaDatoByUsuario(string memory usuario) public view returns(string memory retorno){
            
        string memory resultado = "";
        for(uint i=0; i<registros.length;i++){
            bytes32 usuPara = keccak256(bytes(usuario));
            bytes32 usuReg = keccak256(bytes(registros[i].usuario));
            if(usuReg == usuPara){
                
                resultado = strConcat(resultado,registros[i].usuario, ":");
                resultado = strConcat(resultado,registros[i].parcela, ":");
                resultado = strConcat(resultado,registros[i].tipo_dato, ":");
                resultado = strConcat(resultado,registros[i].dato, ":");
                resultado = strConcat(resultado,registros[i].fecha, ";");
            }
        }
        return resultado;
    }
    
    
    function recuperaDatoByParcela(string memory parcela) public view returns(string memory retorno){
            
        string memory resultado = "";
        for(uint i=0; i<registros.length;i++){
            bytes32 usuPara = keccak256(bytes(parcela));
            bytes32 usuReg = keccak256(bytes(registros[i].parcela));
            if(usuReg == usuPara){
                
                resultado = strConcat(resultado,registros[i].usuario, ":");
                resultado = strConcat(resultado,registros[i].parcela, ":");
                resultado = strConcat(resultado,registros[i].tipo_dato, ":");
                resultado = strConcat(resultado,registros[i].dato, ":");
                resultado = strConcat(resultado,registros[i].fecha, ";");
            }
        }
        return resultado;
    }
    
    
    function strConcat(string _a, string _b, string _c, string _d, string _e) internal returns (string){
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _bc = bytes(_c);
    bytes memory _bd = bytes(_d);
    bytes memory _be = bytes(_e);
    string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
    for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
    for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
    for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
    return string(babcde);
}

function strConcat(string _a, string _b, string _c, string _d) internal returns (string) {
    return strConcat(_a, _b, _c, _d, "");
}

function strConcat(string _a, string _b, string _c) internal returns (string) {
    return strConcat(_a, _b, _c, "", "");
}

function strConcat(string _a, string _b) internal returns (string) {
    return strConcat(_a, _b, "", "", "");
}
    
    
    
}