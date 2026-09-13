import { IsOptional, IsDateString, IsNumber, IsString } from 'class-validator';

export class UpdateLogbookEntryDto {
  @IsOptional()
  @IsDateString()
  entryDate?: string;

  @IsOptional()
  @IsString()
  taskDescription?: string;

  @IsOptional()
  @IsNumber()
  hoursRendered?: number;
}