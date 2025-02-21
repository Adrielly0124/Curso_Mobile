import java.util.Scanner;

public class CalculadoraSimples {
    //Atributos (carcacteisticas)
    double numero1, numero2;
    double resultado;
    int operacao;
    boolean continuar = true;
    
    //Construtor (Instânciamento) - padrão (vazio)

    //Métodos (as ações)
    
    //soma
    public double soma (double a, double b){ //double a, double b, são parametros locais do método
    return a+b;
    }
    //subtração
    public double sub (double a, double b){ //double a, double b, são parametros locais do método
    return a-b;
    }
    //multiplicação
    public double multi (double a, double b){ //double a, double b, são parametros locais do método
        return a*b;
    }
    //divisão
    public double div (double a, double b){ //double a, double b, são parametros locais do método
    return a/b;
    }

    //menu
    public void menu(){
        Scanner sc = new Scanner(System.in); // criou um objeto chamado de sc da classe scanner
        do {
            System.out.println("=== CALCULADORA SIMPLES ===");
            System.out.println("Escolha a Operação Desejada");
            System.out.println("1. Soma;");
            System.out.println("2. Subtração;");
            System.out.println("3. Multiplicação");
            System.out.println("4. Divisão;");
            System.out.println("5. Sair.");
            System.out.println("===========================");
            operacao = sc.nextInt();
            switch (operacao) { 
                case 1:
                    System.out.println("Informe o 1º número");
                    numero1=sc.nextInt();
                    System.out.println("Informe o 2º número");
                    numero2=sc.nextInt();
                    resultado = soma(numero1,numero2);
                    System.out.println("O resultado é " +resultado);
                    break;
                case 2:
                    System.out.println("Informe o 1º número");
                    numero1=sc.nextInt();
                    System.out.println("Informe o 2º número");
                    numero2=sc.nextInt();
                    resultado = sub (numero1,numero2);
                    System.out.println("O resultado é " +resultado);
                    break;
                case 3:
                    System.out.println("Informe o 1º número");
                    numero1=sc.nextInt();
                    System.out.println("Informe o 2º número");
                    numero2=sc.nextInt();
                    resultado = multi (numero1,numero2);
                    System.out.println("O resultado é " +resultado);
                    break;
                case 4:
                    System.out.println("Informe o 1º número");
                    numero1=sc.nextInt();
                    System.out.println("Informe o 2º número");
                    numero2=sc.nextInt();
                    if (numero2 == 0) {
                        System.out.println("Não Dividirás por 0");                        
                    }else {
                        resultado = div (numero1,numero2);
                        System.out.println("O resultado é " +resultado);
                    }
                    break;

                case 5:
                    System.out.println("Saindo...");
                    continuar = false;
                    break;
                default:
                System.out.println("Escolha uma operação válida");
                    break;
            }
        } while (continuar);
        sc.close();
    }
}
