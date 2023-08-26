


#include <iostream>

// Efetuar a ligação ao ficheiro com o código Assembly

extern "C" {
    int MULT_MAT(int*, int*, int*, int);
}

// Funçao para multiplicar matrizes em C


void MULT_MAT_C(int* m1,int* m2,int*m3,int tamanhoMat) {
    int aux = 0;
    int i, j, k;
    for (i = 0; i < tamanhoMat; i++) {
        for (j = 0; j < tamanhoMat; j++) {
            m3[i * tamanhoMat + j] = 0;
            for (k = 0; k < tamanhoMat; k++) {
                m3[i * tamanhoMat + j] += m1[i * tamanhoMat + k] * m2[k * tamanhoMat + j];
           }
        }
    }
}

int main()
{
    //declaração de variáveis

    int* matriz1;
    int* matriz2;
    int* matTransp;
    int* matrizRes;
    int tamanho;

    // Validação do tamanho do array (tem que ser múltiplo de 4)

    do {
        printf("Introduza o tamanho do Array: ");
        scanf_s("%d", &tamanho);
        if (tamanho % 4 != 0) {

           printf("O valor tem que ser multiplo de 4!\n");
        }
    } while (tamanho % 4 != 0);

    // Definição do tamanho do array

    matriz1 = (int*)malloc(sizeof(int) * (tamanho * tamanho));
    matriz2 = (int*)malloc(sizeof(int) * (tamanho * tamanho));
    matTransp = (int*)malloc(sizeof(int) * (tamanho * tamanho));
    matrizRes = (int*)malloc(sizeof(int) * (tamanho * tamanho));

    //Inicialização dos arrays a serem multiplicados

    for (int i = 0; i < (tamanho*tamanho); i++) {
        matriz1[i] = i + 1;
        matriz2[i] = i + 1;
    }

    // Calculo da matriz Transposta

    for (int i = 0; i < tamanho; i++) {
        for (int j = 0; j < tamanho; j++) {
            matTransp[j * tamanho + i] = matriz1[i * tamanho + j];
        }
    }


    // Call das funções

    //MULT_MAT_C(matriz1, matriz2, matrizRes, tamanho);
    MULT_MAT(matriz1, matTransp, matrizRes, tamanho);

    // Output do array resultado


    for (int i = 0; i < tamanho; i++) {
        for (int j = 0; j < tamanho; j++) {
            printf("\t[%d]", matrizRes[i * tamanho + j]);
        }
        printf("\n");
    }
    





}

