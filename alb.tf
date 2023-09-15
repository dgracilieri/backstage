resource "aws_alb" "example" {
  name            = "example-alb"
  internal        = false
  security_groups = ["sg-12345678"]
  subnets         = ["subnet-12345678", "subnet-87654321"]

  idle_timeout               = 30
  enable_deletion_protection = false

  tags = {
    Environment = "production"
    Name        = "example-alb"
  }
}

resource "aws_alb_listener" "example" {
  load_balancer_arn = aws_alb.example.arn   # Referencia al recurso ALB creado anteriormente
  port= 80                            # Puerto de escucha del ALB Listener (HTTP)  									   # Protocolo de escucha del ALB Listener (HTTP)  

  default_action {                         # Acción predeterminada del ALB Listener cuando se recibe una solicitud HTTP  
    type             = "forward"           # Tipo de acción predeterminada (enviar a Target Group)  
    target_group_arn = aws_alb_target_group.example.arn # Referencia al recurso Target Group creado anteriormente  
  }  					       }   
  resource "aws_alb_target_group" "example" {   
    name = "example-tg"     
    }                    
# Nombre del Target Group   port=8080
# Puerto del Target Group (no es el mismo que el puerto del Listener)   protocol = "HTTP"
# Protocolo del Target Group (no es el mismo que el protocolo del Listener)   vpc_id   = var.vpcid 
# ID de VPC donde se creará el Target Group } 3. Agregar instancias EC2 como miembros del target group: resource "aws_lb_