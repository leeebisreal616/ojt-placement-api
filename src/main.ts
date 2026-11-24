import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
  app.enableCors({
    origin: ['http://localhost:5173', 'http://localhost:5174'], 
    credentials: true,
  });
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();