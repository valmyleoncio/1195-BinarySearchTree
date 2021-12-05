import 'dart:io';

class No {
  int valor;
  No? esquerdo;
  No? direito;
  No(this.valor, {this.esquerdo = null, this.direito = null});

  int get getValor {
    return valor;
  }

  No? get getEsquerdo {
    return esquerdo;
  }
  
  void set setEsquerdo(No? no) {
    this.esquerdo = no;
  }

  No? get getDireito {
    return direito;
  }
  
  void set setDireito(No? no) {
    this.direito = no;
  }
}

class Arvore {
  No? raiz;
  Arvore({this.raiz = null});

  No? get getRaiz {
    return raiz;
  }

  void adicionarNo(int valor){
    No novoNo = new No(valor);
    if(raiz == null){
      this.raiz = novoNo;
    } else {
      No atual = this.raiz!;
      while(true){

        if(novoNo.getValor <  atual.getValor){
          if(atual.getEsquerdo != null){
            atual = atual.getEsquerdo!;
          } else {
            atual.setEsquerdo = novoNo;
            break;
          }
        } else {
          if(atual.getDireito != null)
          {
            atual = atual.getDireito!;
          } else {
            atual.setDireito = novoNo;
            break;
          }
        }
        
      }
    }
  }

  void prefixo(No? atual){
    if(atual != null){
      stdout.write(atual.getValor);
      stdout.write(" ");
      prefixo(atual.getEsquerdo);
      prefixo(atual.getDireito);
    }
  }

  void infixo(No? atual){
    if(atual != null){
      infixo(atual.getEsquerdo);
      stdout.write(atual.getValor);
      stdout.write(" ");
      infixo(atual.getDireito);
    }
  }

  void posfixo(No? atual){
    if(atual != null){
      posfixo(atual.getEsquerdo);
      posfixo(atual.getDireito);
      stdout.write(atual.getValor);
      stdout.write(" ");
    }
  }
}

void main(){

  int? cases = int.parse(stdin.readLineSync()!);

  for(int i = 0; i < cases; i++){

    print("Case ${i+1}:");
    int? qtde = int.parse(stdin.readLineSync()!);
    Arvore arvore = new Arvore();

    for(int j = 0; j < qtde; j++){
      int? valor = int.parse(stdin.readLineSync()!);
      arvore.adicionarNo(valor);
    }

    stdout.write("Pre.: ");
    arvore.prefixo(arvore.getRaiz);
    stdout.write("\n");
    stdout.write("In..: ");
    arvore.infixo(arvore.getRaiz);
    stdout.write("\n");
    stdout.write("Post: ");
    arvore.posfixo(arvore.getRaiz);
    print("\n");
  }
}