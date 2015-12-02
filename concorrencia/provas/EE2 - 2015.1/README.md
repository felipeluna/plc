##Questao 1

A class **Rooms** gerencia uma coleção de quartos, indexada de 0 a m (onde m é um argumento para o contrustor). therad podeme entrar ou sair de qualquer quarto nessa faixa. Cada quarto pode conter uma quantidade arbitrária de threads simultaneas, mas a qualquer momento, apenas um quarto pode estar ocupado. Por exemplo, se há dois quartos com índices 0 e 1, então qualquer número de threads podem entrar no quarto 1 enquanto o quarto 0 aind estiver ocupado.
    Cada quarto pode ter atribuído a ele um **tratador de saída**: clamar **setHandler(i,h)** estabele que **h** é o tratator de saída para oquarto i.O tratator de saía é chamado pela última thread a sair de um quarto, mas antes que qualquer thread entre em qualquer quarto. Este método é chamado exatamente uma vez e, enquanto ele está rodando, nenhuam thread entra em nenhum dos quartos. Implemente a classe Rooms. Certifique-se de que:

    * Se alguma thread está no quarto i, nenhuma thread está em um quarto j tal que i ≠ j
    * A última thread a sair de um quarto chama seu tratador de saída e nenhuma thread está em qualquer um dos quartos enquanto esse tratador está em execução.
    * Threads não devem sofrer *starvation* ao tentar entrar nos quartos. Suponha que o escalonador é justo e que a possibilidade de *starvation* depende apenas da aplicação.
