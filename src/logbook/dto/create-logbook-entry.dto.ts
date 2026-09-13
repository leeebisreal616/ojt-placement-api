import { IsNumber, IsNotEmpty, IsDateString } from 'class-validator';

export class CreateLogbookEntryDto {
  @IsNumber()
  placementId: number;

  @IsDateString()
  entryDate: string;

  @IsNotEmpty()
  taskDescription: string;

  @IsNumber()
  hoursRendered: number;
}