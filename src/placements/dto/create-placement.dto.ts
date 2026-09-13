import { IsNotEmpty, IsNumber, IsDateString, IsOptional } from 'class-validator';

export class CreatePlacementDto {
  @IsNumber()
  studentId: number;

  @IsNotEmpty()
  companyName: string;

  @IsNotEmpty()
  position: string;

  @IsDateString()
  startDate: string;

  @IsOptional()
  @IsDateString()
  endDate?: string;
}