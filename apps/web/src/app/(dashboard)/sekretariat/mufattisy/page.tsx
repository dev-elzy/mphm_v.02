"use client";
import { useAcademicYear } from "@/components/shared/AcademicYearContext";
import { MufattisyTab } from "@/features/sekretariat/components/MufattisyTab";

export default function MufattisyTabPage() {
  const { isReadOnly } = useAcademicYear();
  return <MufattisyTab isReadOnly={isReadOnly} onViewDetail={() => {}} />;
}
