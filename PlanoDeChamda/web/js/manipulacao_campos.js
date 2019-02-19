function checkedDependente(){
    var checkBox = document.getElementById("checkboxDependente");

    if(checkBox.checked == true){
        document.getElementById("div_qtde_dependente").style.display = "block";
        document.getElementById("div_dados_dependente").style.display = "block";
    }else{
        document.getElementById("div_qtde_dependente").style.display = "none";
        document.getElementById("div_dados_dependente").style.display = "none";
    }
}

function checkedConjuge(){
    var checkBox = document.getElementById("checkboxConjuge");

    if(checkBox.checked == true){
        document.getElementById("div_dados_conjuge").style.display = "block";
    }else{
        document.getElementById("div_dados_conjuge").style.display = "none";
    }
}
                            
function limpa_div_dados_dependente(){
    document.getElementById("div_dados_dependente").innerHTML="";
}

function qtdeDependente(){                               
    var div_dados_dependente = document.getElementById("div_dados_dependente");

    var qtdeDependente = document.formCadastro.txtNumDependente.value;

    for(var i=0;i<qtdeDependente;i++){

        var div_nome_dependente = document.createElement("div");
        div_nome_dependente.id = "div_nome_dependente";
        div_nome_dependente.className = "form-group col-md-9";

        var label_nome_dependente = document.createElement("label");
        label_nome_dependente.id = "lblDependente";
        label_nome_dependente.for = "lblDependente";
        label_nome_dependente.innerHTML = "Dependente "+(i+1)+": ";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_nome_dependente = document.createElement("input");
        input_nome_dependente.className = "form-control";
        input_nome_dependente.type = "text";
        input_nome_dependente.name = "txtDependente";

        div_nome_dependente.appendChild(label_nome_dependente);
        div_nome_dependente.appendChild(obg);
        div_nome_dependente.appendChild(input_nome_dependente);

        var div_data_nasc_dependente = document.createElement("div");
        div_data_nasc_dependente.id="div_data_nasc_dependente";
        div_data_nasc_dependente.className = "form-group col-md-3";

        var label_data_nasc_dependente = document.createElement("label");
        label_data_nasc_dependente.id="lblDataNascDependente";
        label_data_nasc_dependente.innerHTML = "Data de Nascimento:";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_data_nasc_dependente = document.createElement("input");
        input_data_nasc_dependente.type = "date";
        input_data_nasc_dependente.className = "form-control";
        input_data_nasc_dependente.name = "txtDataNascDependente";

        div_data_nasc_dependente.appendChild(label_data_nasc_dependente);
        div_data_nasc_dependente.appendChild(obg);
        div_data_nasc_dependente.appendChild(input_data_nasc_dependente);

        div_dados_dependente.appendChild(div_nome_dependente);
        div_dados_dependente.appendChild(div_data_nasc_dependente);
    }
}