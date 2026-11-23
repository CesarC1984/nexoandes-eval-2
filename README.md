# Evaluación Sumativa U2 - IaC
## Proyecto NexoAndes

### Descripción
Proyecto de infraestructura como código (IaC) para el
despliegue de la actualización V2 del portal NexoAndes
en AWS.

### Objetivos
- Desplegar el portal V2.
- Implementar un balanceador de carga.
- Distribuir la infraestructura en dos zonas de
  disponibilidad (AZs) de AWS.
- Documentar la equivalencia arquitectónica con Azure.

### Consideraciones
La implementación práctica se realiza en AWS.
Azure se representa únicamente a nivel conceptual
debido a la contingencia técnica autorizada.

### Autenticación AWS
El script de autenticación se encuentra en:

scripts/aws_credenciales.sh

Debe ejecutarse mediante source:

source scripts/aws_credenciales.sh

El script solicita las credenciales temporales de
AWS Academy y verifica la identidad mediante AWS STS.
